      document.getElementById('theme-toggle').addEventListener('click', (e) => {
        const checked = e.target.checked;
        document.body.setAttribute('theme', checked ? 'dark' : 'light');
      });


// Uncomment for RESTAPI calling and CORS Testing
/*
async function postRequest() {
  const url = 'https://dhwf1ldx0j.execute-api.ap-south-1.amazonaws.com/prod/moody';
  const data = {}; // Replace with your actual JSON payload if needed

  try {
    const response = await fetch(url, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(data)
    });

    if (!response.ok) {
      throw new Error(`HTTP error! status: ${response.status}`);
    }

    const jsonResponse = await response.json();
    console.log(jsonResponse);
  } catch (error) {
    console.error('Error:', error);
  }
}

postRequest();

*/