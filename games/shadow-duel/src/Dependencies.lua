--
-- lib
--
Class = require 'lib/class'
push = require 'lib/push'
Timer = require 'lib/knife.timer'
baton = require 'lib/baton'
lume = require 'lib/lume'
iffy = require 'lib/iffy'

--
-- src
--

-- utility
require 'src/constants'
require 'src/StateMachine'

-- game states
require 'src/states/BaseState'
require 'src/states/game/PlayState'
-- require 'src/states/game/StartState'

-- classes
require 'src/Player'
require 'src/Enemy'

--
-- assets
--

-- gSounds = {}

-- TODO: setup iffy sprites and tilesets here

-- gFonts = {
--     ['small'] = love.graphics.newFont('fonts/font.ttf', 8),
--     ['medium'] = love.graphics.newFont('fonts/font.ttf', 16),
--     ['large'] = love.graphics.newFont('fonts/font.ttf', 32),
--     ['title'] = love.graphics.newFont('fonts/ArcadeAlternate.ttf', 32)
-- }
