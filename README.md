# Shackle Tattle

A simple tool to identify players who broke shackles in World of Warcraft by parsing the `WoWCombatLog.txt` file.

## What This Tool Does

This tool scans your WoW combat log file and creates a list of all players who have broken shackles. It's useful for guild leaders, raid organizers, or anyone who wants to track who's not following crowd control protocols.

## Requirements

- **Windows users**: PowerShell (included with Windows 10/11)
- **Linux/Mac users**: Bash shell (usually pre-installed)
- A `WoWCombatLog.txt` file in your WoW Logs folder

## Installation

1. Download the appropriate script for your operating system:
   - **Windows**: `shackletattle.ps1`
   - **Linux/Mac**: `shackletattle.sh`

2. Place the script in your WoW Logs folder (usually `World of Warcraft/Logs/`)

## Usage

### Windows (PowerShell)

1. **Open PowerShell** in your WoW Logs folder:
   - Right-click in the folder while holding Shift
   - Select "Open PowerShell window here"
   - OR navigate to the folder and type `powershell` in the address bar

2. **Run the script**:
   ```
   .\shackletattle.ps1
   ```

3. **Optional**: Specify a different log file path:
   ```
   .\shackletattle.ps1 "C:\path\to\your\WoWCombatLog.txt"
   ```

### Linux/Mac (Bash)

1. **Open Terminal** and navigate to your WoW Logs folder:
   ```
   cd /path/to/World\ of\ Warcraft/Logs/
   ```

2. **Make the script executable** (first time only):
   ```
   chmod +x shackletattle.sh
   ```

3. **Run the script**:
   ```
   ./shackletattle.sh
   ```

4. **Optional**: Specify a different log file path:
   ```
   ./shackletattle.sh /path/to/your/WoWCombatLog.txt
   ```

## Output

The script will output a list of player names (one per line) who have broken shackles. If no shackle breaks are found, no output will be displayed.

## Troubleshooting

- **"File not found" error**: Make sure you're running the script from the same folder as your `WoWCombatLog.txt` file
- **"Permission denied" (Linux/Mac)**: Run `chmod +x shackletattle.sh` to make the script executable
- **PowerShell execution policy error**: Run `Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser` in PowerShell as Administrator

## How It Works

The script searches for lines containing "Shackle Shatter hits" in your combat log and extracts the player names from those entries. It automatically removes duplicates and formats the output for easy reading.

## Note

Make sure your WoW combat logging is enabled in the game settings for this tool to work properly.
