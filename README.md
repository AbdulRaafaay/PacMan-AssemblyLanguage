# Pacman Game - Assembly Language Project

## Overview
This is a Pacman-style game implemented in x86 Assembly Language using the Irvine32 library. The game features multiple levels, ghosts that chase the player, score tracking, lives system, and sound effects.

## Features
- **Three unique levels** with different maze designs  
- **Ghost AI** that chases the player  
- **Score system** with points for collecting dots and fruits  
- **Lives system** (3 lives per level)  
- **Sound effects** for game events  
- **Teleportation** points in Level 3  
- **Random fruit generation** for bonus points  
- **Pause functionality** during gameplay  
- **Score saving** to a text file  

## Controls
- **W** - Move Up  
- **A** - Move Left  
- **S** - Move Down  
- **D** - Move Right  
- **P** - Pause Game  
- **E** - Exit Game  

## Game Elements
- **Pacman (X)** - Player character  
- **Ghosts (G)** - Enemies that chase the player  
- **Dots (.)** - Worth 10 points each  
- **Fruits (o)** - Worth 100 points each  
- **Walls (#, |, _)** - Obstacles that block movement  
- **Teleporters (T)** - In Level 3 only  

## Requirements
- MASM (Microsoft Macro Assembler)  
- Irvine32 library  
- Winmm.lib for sound effects  
- Windows operating system  

## How to Run

### Visual Studio (Recommended)
1. Install [Visual Studio](https://visualstudio.microsoft.com/) with the **Desktop Development with C++** workload.
2. Set up the **Irvine32 library**:
- Download it from [kipirvine.com](https://www.kipirvine.com/asm/examples/index.htm).
- Copy `Irvine32.inc` to your VS `Include` directory.
- Copy `Irvine32.lib`, `kernel32.lib`, `user32.lib`, `winmm.lib` to your `Lib` directory.
- Ensure `Irvine32.obj` is available in the project directory or properly referenced.
3. Create a new **Win32 Console Project** in Visual Studio.
4. Add `pacman.asm` to the project.
5. Configure project settings:
- Add include/lib directories to **VC++ Directories**.
- Add `irvine32.lib`, `kernel32.lib`, `user32.lib`, and `winmm.lib` to **Linker > Input > Additional Dependencies**.
6. Build and run the project (**Ctrl + F5**).

> ❗ Make sure you are using the x86 build configuration (not x64), as the Irvine32 library is 32-bit only.

## Game Progression
1. **Level 1**:
- 2 ghosts
- Basic maze layout
- Score target: 500 points to advance

2. **Level 2**:
- 3 ghosts
- More complex maze
- Random fruits appear
- Score target: 1000 points to advance

3. **Level 3**:
- 5 ghosts
- Most complex maze
- Teleportation points
- Game completes at 3000 points

## Sound Effects
The game includes several sound effects:
- Pacman beginning sound  
- Ghost collision sound  
- Point collection sound  
- Game over sound  

## Files
- `pacman.asm` - Main game source code  
- `Name_Score.txt` - File created to store player name and score  

## Notes
- The game was developed using the Irvine32 library for Windows  
- Sound effects require `winmm.lib`  
- The code includes extensive comments explaining the functionality  

Enjoy the game!
