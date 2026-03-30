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

## 🚀 How to Run

1. **Install Godot 4.4+** from https://godotengine.org
2. **Open Project**: File → Open Project → Select this folder
3. **Enable MCP Plugin** (optional): Project → Project Settings → Plugins → Enable "Godot MCP"
4. **Run Game**: Press F5 or click Play button

## 🎯 Controls

- **Arrow Keys / A,D**: Switch lanes left/right
- **Spacebar**: Jump over obstacles

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