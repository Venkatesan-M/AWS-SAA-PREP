require 'aws-sdk-s3'
require 'openssl'

# Generate an encryption key
encryption_key = OpenSSL::PKey::RSA.new(1024)

bucket = 'encryption-client-aws-prep' # Replace with your bucket name
file_key = 'clientencryptedfile.txt' # Replace with your file name

# Read the content of the file
file_content = File.read(file_key)

# Initialize the S3 encryption client
s3_encryption_client = Aws::S3::EncryptionV2::Client.new(
  encryption_key: encryption_key,
  key_wrap_schema: :rsa_oaep_sha1, # The key_wrap_schema must be rsa_oaep_sha1 for asymmetric keys
  content_encryption_schema: :aes_gcm_no_padding,
  security_profile: :v2 # Use :v2_and_legacy to allow reading/decrypting objects encrypted by the V1 encryption client
)

# Put the object into the S3 bucket with encryption
s3_encryption_client.put_object(bucket: bucket, key: file_key, body: file_content)

# Get the object from the S3 bucket and decrypt it
decrypted_content = s3_encryption_client.get_object(bucket: bucket, key: file_key).body.read
puts "Decrypted content: #{decrypted_content}"

# Reading the encrypted object without the encryption client
# results in getting the cipher text
cipher_text = Aws::S3::Client.new.get_object(bucket: bucket, key: file_key).body.read
puts "Cipher text: #{cipher_text}"
