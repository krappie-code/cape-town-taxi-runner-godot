# 🚐 Cape Town Taxi Runner - Godot Edition

**Professional Godot 4.4 version of the authentic South African minibus taxi endless runner!**

## 🎮 Game Features

### Authentic Cape Town Experience
- **12 Real Destinations**: Bellville, Wynberg, Khayelitsha, Mitchell's Plain, Parow, Goodwood, Langa, Gugulethu, Cape Town CBD, Sea Point, Observatory, Rondebosch
- **Authentic Obstacles**: Potholes, roadwork, traffic, speed bumps (very realistic for South African roads!)
- **Traditional Taxi Colors**: Golden yellow body with red and green racing stripes

### Gameplay
- **3-Lane Endless Runner** with smooth lane switching
- **Jump Mechanics** to leap over obstacles
- **Passenger Pickup System** - 100 points per passenger
- **Progressive Difficulty** - Speed increases over time
- **Collision Detection** with proper physics

## 🛠️ Technical Features

- **Godot 4.4** professional game engine
- **CharacterBody2D** physics system
- **Scene/Node architecture** for expandability
- **Mobile-ready** for iOS/Android export
- **MCP Plugin** compatible for AI-assisted development

## 🚀 Quick Start (2 minutes to play!)

### Step 1: Get Godot
1. **Download Godot 4.4+** from https://godotengine.org/download (it's free!)
2. **Extract and run** the Godot executable (no installation needed)

### Step 2: Clone and Play
```bash
git clone https://github.com/krappie-code/cape-town-taxi-runner-godot.git
cd cape-town-taxi-runner-godot
```

### Step 3: Open in Godot
1. **Launch Godot**
2. **Click "Import"** 
3. **Browse to this folder** and select `project.godot`
4. **Click "Import & Edit"**
5. **Press F5** or click the ▶️ Play button
6. **Start collecting passengers!** 🚐💨

### Alternative: Direct Download
- **Download ZIP** from GitHub
- **Extract** the files  
- **Open in Godot** as above

## 🎯 Controls & Gameplay

### Controls
- **Arrow Keys / A,D**: Switch lanes left/right
- **Spacebar**: Jump over obstacles

### How to Play
- **Collect passengers** 👥 for 100 points each
- **Avoid obstacles** 🚧 (potholes, roadwork, traffic, speed bumps)
- **Jump over** obstacles you can't avoid
- **Survive as long as possible** - speed increases over time!
- **Reach destinations** like Bellville, Wynberg, Khayelitsha

### Pro Tips
- **Time your jumps** - you can't change lanes while airborne
- **Look ahead** - obstacles spawn in different patterns
- **Collect passengers** in risky lanes for higher scores
- **Different obstacles** require different strategies (jump vs. dodge)

## 📱 Mobile Export

This project is ready for mobile export:

1. **Install Export Templates**: Editor → Manage Export Templates
2. **Configure Export Presets**: Project → Export
3. **Build for Android/iOS**: Export → Build

## 🆚 Upgrades from HTML5 Version

| Feature | HTML5 | Godot |
|---------|--------|--------|
| Graphics | Canvas 2D | Professional nodes/scenes |
| Physics | Basic collision | CharacterBody2D with proper physics |
| Audio | Limited | Full audio system ready |
| Mobile | Web only | Native iOS/Android export |
| Performance | Browser-dependent | Optimized native code |
| Expandability | Limited | Unlimited - add 3D, multiplayer, etc. |

## 🔧 Game Architecture

```
Main.tscn (Main Scene)
├── Background (ColorRect - Cape Town sky)
├── Road (ColorRect - 3-lane road)
├── LaneLines (Yellow lane dividers)
├── Player (CharacterBody2D)
│   ├── Sprite (Golden taxi with stripes)
│   └── CollisionShape2D
├── Obstacles (Node2D container)
├── Passengers (Node2D container)
├── UI (CanvasLayer)
│   ├── Score (Label)
│   └── Destination (Label)
└── GameTimer (Spawns obstacles/passengers)
```

## 🎨 Visual Design

- **Cape Town Sky** gradient background (blue to green)
- **3-Lane Road** with yellow dividing lines
- **Golden Taxi** with red and green racing stripes
- **Authentic UI** showing score and destination

## 🚀 Future Enhancements

With Godot's power, we could easily add:
- **3D Graphics** and environments
- **Sound Effects** and music
- **Multiple Taxi Types** 
- **Different Cape Town Routes**
- **Multiplayer** support
- **Leaderboards** and achievements
- **Physics-based** obstacles and interactions

## 🦀 Built with Love by Krappie

Created as a demonstration of Godot MCP capabilities - from concept to working game in one session!

---

**Ready to navigate Cape Town traffic? Jump in and start collecting passengers!** 🚐💨