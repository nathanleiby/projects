# centaur-defense

Tower defense with centaurs.

Features to build:
- [x] 24x36 grid
- [x] color squares based on PATH or GROUND
- [x] show a "player"
- [x] allow user to walk around the grid
  - [x] move with keyboard
  - [x] move with controller
- [x] add a 2nd player
- [x] have enemies walk along the path
- [...] player goal: dont get over-run
    - [x] starting health
    - [x] lose health whenever enemy gets to end of path
    - 0 health, lose
- [ ] allow user to build a cen(tower)
- [ ] allow towers to shoot enemies
- [ ] some tilemaps for basic visual FX

Ideas:
- centaurs aren't static like normal towers. they can move
    - they can only move on certain terrain, determined by the color of the fur on their lower have
- centaurs have different attacks based on top half
- centaur hero
    - you can control one hero and do more strategic actions with them
    - upgrade your hero, etc
- multiplayer
    - start with local coop
- allow using controllers (nonkeyboard)
- what kind of layout? (grid, hex, neither)

Graphics:
- https://opengameart.org/content/centaur-0
- enemies on horses at some point? https://opengameart.org/content/lpc-horse-riding-updated-091
- doing it to protect the forest / the horses? https://opengameart.org/content/lpc-horses


Libs:
- Try using an inputs lib https://github.com/love2d-community/awesome-love2d#input

