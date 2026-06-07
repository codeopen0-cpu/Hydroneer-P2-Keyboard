# Hydroneer Player 2 Keyboard Setup

Let Player 2 use keyboard + mouse instead of a controller in Hydroneer multiplayer!

## How it works

Hydroneer uses Steam Remote Play for multiplayer, which forces Player 2 to use a game controller. This tool works around that by:

1. **vJoy** - Creates a virtual Xbox controller that Windows/Steam sees as a real controller
2. **UCR (Universal Controller Remapper)** - Translates keyboard/mouse inputs into virtual controller signals

## Usage

1. Download `HydroneerP2Setup.bat`
2. **Double-click it** on the computer that will be Player 2
3. Follow the on-screen steps (it downloads and installs everything)
4. Launch UCR, load the Hydroneer profile, keep it running
5. Join your friend's game via Steam Remote Play

## Download

[⬇️ HydroneerP2Setup.bat](https://github.com/codeopen0-cpu/Hydroneer-P2-Keyboard/raw/master/HydroneerP2Setup.bat)

## Keyboard Mappings

| Key | Action |
|-----|--------|
| WASD | Move |
| Mouse | Look around |
| Left Click | Pick up / Action |
| Right Click | Place / Drop |
| Space | Jump |
| E | Interact |
| Shift | Sprint |
| Ctrl | Crouch |
| Tab | Inventory |
| Q | Back |

## Requirements

- Windows 10 or 11 (64-bit)
- Steam must be installed
- The host must also have a controller (real or virtual) connected
