const os = require('os');
const { exec } = require('child_process');

// Get the network interfaces
const interfaces = os.networkInterfaces();

// Find the wireless network interface
const wifiInterface = interfaces['Wi-Fi'];

// Get the IPv4 address of the wireless network adapter
exec('ipconfig', (err, stdout, stderr) => {
  if (err) {
    console.error(err);
    return;
  }

  // Use a regular expression to find the IPv4 address
  const ipv4Regex = /IPv4 Address[.\s\S]*?(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})/;
  const match = stdout.match(ipv4Regex);

  if (match && match[1]) {
    console.log(match[1]);
  } else {
    console.error('Unable to find IPv4 address for Wi-Fi interface');
  }
});
