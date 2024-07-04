# To Run this, First Install all imports by `Bundle install`
# To Execute the code Run ` BUCKET_NAME='Your-Sample-Ruby-S3-SDK-Bucket-Name' bundle exec ruby s3.rb `

require 'aws-sdk-s3'  # AWS SDK for S3
require 'pry'
require 'securerandom'  # SecureRandom module for generating UUIDs

# Fetch bucket name from environment variable
bucket_name = ENV['BUCKET_NAME']
# Define the AWS region
region = 'ap-south-1'

# Initialize the S3 client with the specified region
client = Aws::S3::Client.new(
  region: region
  # Credentials are assumed to be set via environment variables or default AWS configuration
)

# Create the S3 bucket
begin
  resp = client.create_bucket({
    bucket: bucket_name,
    create_bucket_configuration: {
      location_constraint: region,
    },
  })
  puts "Bucket #{bucket_name} created successfully."
rescue Aws::S3::Errors::BucketAlreadyOwnedByYou
  puts "Bucket already exists. Skipping creation."
rescue Aws::S3::Errors::ServiceError => e
  puts "Service error occurred: #{e.message}"
  exit 1
end

# binding.pry # uncomment if you need to debug in between of the execution.

# Generate a random number of files to upload (between 1 and 3)
number_of_files = 1 + rand(3)

puts "Number of files to be uploaded: #{number_of_files}"

number_of_files.times.each do |i|
  puts "Uploading file number: #{i+1}"
  filename = "file_#{i}.txt"
  output_path = "/tmp/#{filename}"

  # Create a file with a random UUID as content
  File.open(output_path, "w") do |f|
    f.write SecureRandom.uuid
  end

  # Upload the file to the specified S3 bucket
  File.open(output_path, "rb") do |file|
    client.put_object(
      bucket: bucket_name,
      key: filename,
      body: file
    )
  end

  # Remove the temporary file after upload
  File.delete(output_path)
end

puts "All files uploaded successfully."
