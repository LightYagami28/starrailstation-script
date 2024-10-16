# ⭐ Star Rail Station - Pity Script

## Overview
The **Star Rail Station Pity Script** simplifies the execution of a PowerShell script called `Pity Tracker.ps1`. This guide provides step-by-step instructions to set up and run the script effectively.

## Usage Instructions

### Download and Set Up:
- **Shortcut File**: Copy the `.lnk` shortcut file to your desktop.
- **PowerShell Script**: Place the `Pity Tracker.ps1` file in the root directory of your `C:\` drive.

### Run the Script:
- Double-click the desktop shortcut to launch the PowerShell script.

### Shortcut Configuration:
- If the shortcut doesn't work, ensure the following command is used in its properties:

    ```
    C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -NoExit -ExecutionPolicy Bypass -File "C:\Pity Tracker.ps1"
    ```

### Interact with the Script:
- Follow any on-screen prompts or instructions during script execution.

## Security Measures 🔒
The script includes the following security enhancements:

- **TLS 1.2**: Ensures secure communication by enforcing TLS version 1.2.
- **Secure Downloads**: Downloads external content using `Invoke-RestMethod` over secure channels.
- **English Comments**: All comments in the script are written in English to improve accessibility and understanding.

## System Requirements
- **PowerShell**: Ensure PowerShell is installed and available on your system.
- **Operating System**: Windows-based environment is required for running the script.

## Important Notes
- **Review the Script**: Always review and understand the script's code before running it.
- **Security Awareness**: Be cautious when running scripts downloaded from the internet. Consider executing them in a controlled environment.
- **Troubleshooting**: If errors occur, refer to the PowerShell error messages or consult the official documentation for assistance.

## Credits
- **Original Idea**: [@exterpolation](https://github.com/exterpolation)
- **Special Thanks**: [@Alessandro Maule](https://github.com/LightYagami28)
