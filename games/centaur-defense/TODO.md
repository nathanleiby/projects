## TODOs

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
- [x] improve map generation
- [x] some tilemaps for basic visual FX
- [ ] better walkin around
- [ ] add player and enemy sprites
- [ ] allow user to build a cen(tower)
- [ ] allow towers to shoot enemies
- [ ] update player start locations - corners? on certain landtype?
- [x] allow fullscreen
    - [x] fix fullscreen => small bug... needs to call push
- [ ] add music
- [ ] add fx 
    - attacks
    - enemy death
    - spawning a centaur
    - movement
- build GUI around the map
    - player:
        - centaur selection
        - hero stats
        - $$ 
    - team:
        - score
        - health
        - time / waves remaining
- funz - love2d loading screen

Ideas:
- centaurs aren't static like normal towers. they can move
    - they can only move on certain terrain, determined by the color of the fur on their lower half
- centaurs have different attacks based on top half
- centaur hero
    - you can control one hero and do more strategic actions with them
    - upgrade your hero, etc
- multiplayer
    - start with local coop
- [x] allow using controllers (nonkeyboard)
- what kind of layout? (grid, hex, neither)
- explore rendering text in hi-res, even tho graphics in low res https://www.reddit.com/r/gamedev/comments/1i5tck/what_resolution_is_appropriate_for_a_modern/cb1owqr

Graphics:
- https://opengameart.org/content/centaur-0
- enemies on horses at some point? https://opengameart.org/content/lpc-horse-riding-updated-091
- doing it to protect the forest / the horses? https://opengameart.org/content/lpc-horses


Libs:
- [x] Try using an inputs lib https://github.com/love2d-community/awesome-love2d#input


Graphics Attiribution:
- https://opengameart.org/content/16x16-tileset-water-dirt-forest
- https://opengameart.org/content/forest-tiles
- https://opengameart.org/content/medieval-rts-120
    - lots of good stuff here! https://opengameart.org/content/kenney-assets
