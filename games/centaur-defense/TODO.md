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
- [ ] smoother enemy movement - add tweening or update by frame instead of tick?
- [ ] draw centaur in diff colors
- [x] add player and enemy sprites
- [x] allow player to attack enemies (squish!)
- [ ] allow user to build a cen(tower)
- [ ] allow towers to shoot enemies
- [ ] update player start locations - corners? on certain landtype?
- [x] allow fullscreen
  - [x] fix fullscreen => small bug... needs to call push
- [x] add music
- [ ] add fx
  - attacks
  - [x] enemy death
  - spawning a centaur
  - movement
- [ ] more complex enemy paths
- [ ] multiple enemy spawn points
- build GUI around the map
  - player:
    - centaur selection
    - hero stats
    - $$
      $$
  - team:
    - score
    - health
    - time / waves remaining
- funz - love2d loading screen
- autotiling to make edges look nice (https://gamedev.stackexchange.com/questions/58035/how-to-draw-tile-edges-when-you-dont-know-where-theyre-going)

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

Feedback / Ideas

- you are protecting the villagers and trying to get them to the end... enemies build towers
- more interesting paths for villagers to walk on
- collisions -- centaurs can't walk in same place
- level generation -- ensure that it's a valid map (e.g. users can walk the whole path, different types can be accessed, things are in rangeg as needed)
