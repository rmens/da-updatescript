# DirectAdmin Universal Update Script

This script facilitates the updating process on DirectAdmin servers across 
various Linux distributions, including Debian, Ubuntu, RHEL, and CentOS.

## Usage

1. Grant execute permissions to the script:
```bash
chmod +x updatescript-universal-latest.sh
```

2. Run the script:
```bash
./updatescript-universal-latest.sh
```

## Note

- The script detects the underlying OS and uses the appropriate package 
manager (`apt-get`, `yum`, or `dnf`) accordingly.
- It's highly recommended to test the script in a controlled environment 
(e.g., a virtual machine) before deploying it to a live server to ensure 
it behaves as expected.
