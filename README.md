# Shackle Tattle

A simple tool to identify players who break "Shackles of the Legion" in the Turtle WoW Mephistroth encounter by parsing the `WoWCombatLog.txt` file.

## Requirements

- **Windows users**: PowerShell
- **Linux/Mac users**: Bash shell
- A `WoWCombatLog.txt` file in your WoW Logs folder

## Installation

1. Download the appropriate script for your operating system:
   - **Windows**: `shackletattle.ps1`
   - **Linux/Mac**: `shackletattle.sh`

2. Place the script in your WoW Logs folder (usually `World of Warcraft/Logs/`)
  - Make sure your WoW combat logging is enabled in the game settings for this tool to work properly.

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

- The script will output a list of player names who have broken shackles
- If no shackle breaks are found, no output will be displayed
- Each "series" of a break is collapsed into a single line with (#) indicator of how many players it hit
- Timestamps are included to identify who the initial perpetrator might be

```
8/13 21:14:18 Wrukag (37)
8/13 21:20:49 Murzush (8)
8/13 21:20:49 Yunkathu (4)
8/13 21:45:05 Bulak (26)
8/13 21:45:05 Ghamborz (24)
8/13 22:05:47 Imnachar (14)
8/13 22:18:31 Maixent (12)
8/13 22:27:57 Morland (29)
8/13 22:27:58 Eleanore (13)
8/13 22:27:58 Gibbes (10)
8/13 22:37:21 Kaijin (10)
8/13 22:45:10 Zunabar (39)
```

## Troubleshooting

- **"File not found" error**: Make sure you're running the script from the same folder as your `WoWCombatLog.txt` file
- **"Permission denied" (Linux/Mac)**: Run `chmod +x shackletattle.sh` to make the script executable
- **PowerShell execution policy error**: Run `Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser` in PowerShell as Administrator
