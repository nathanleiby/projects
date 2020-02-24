## Game Logic

- [...] add three sounds for diff attack types
- [x] play the sounds in a simple rhythm (e.g. where Q is quarter and (r) is rest)
  - Q (r) Q Q Q
- [ ] you can fire one spell per beat
- [ ] handle spell collisions
- [ ] vary difficulty by
  - frequency of notes sent
  - height of the grid (number of diff replies required)
  - width of the grid (time you have to reply)
  - diff types of spells?
    - kinds like a sword or shield to denote attack or defense?
    - powerups like a "super spell" that's more powerful and pushes further (allows a player to respond if they're slow)
- where the notes collide determines who gets pushed back
  - "sumo" mechanics -- you are trying not to get pushed off the edge
- [ ] hit or miss
  - if correct, say hit! - enemy takes damage
  - if incorrect, say miss! - take damage
- [ ] show health number for hero and enemy

## Graphics

- [ ] Have a cool tweening transition as the character + enemy enter the battle

## Sound Improvements

- [ ] have a backing song / rhythm that the enemy attacks play over, in sync. thus it makes more sense

Gameplay:

1. Enemy duelist makes some sounds (pitches/frequencies) that tell you what attacks they're aboud to make.
2. You have to reply with those pitches in order to block their attacks.
   - If you get them all right, then you rebuff their attacks and then hit them!
3. ?? Should it be a rhythm game (ear trainig + right rhythm) or just call-and-response?
   - Call and response to start! Much simpler to validate user input.
   - Can still have a timer to provide pressure.

## IDEAS

- would it be possible to use the sin wave as a stencil in front of the rainbow, to hide colors except where overlapped by moving wave?
