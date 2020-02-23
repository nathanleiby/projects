require 'src/Dependencies'


iffy.newImage("wizard-attack-spritesheet", "assets/graphics/wizard-attack-spritesheet.png")
local wizardH = 64
local wizardW = 64
local tileH = wizardH / 1
local tileW = wizardW / 1
iffy.newSprite("wizard-attack-spritesheet", "wizard-attack", 4, 1, tileW, tileH)


function love.load()
    -- seed the RNG
    math.randomseed(os.time())

    -- window bar title
    love.window.setTitle('Sonic Blade')
    -- love.graphics.setDefaultFilter('nearest', 'nearest')

    gSounds = {
        ['music'] = love.audio.newSource('assets/sounds/music.mp3', 'static')
    }

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        vsync = true,
        resizable = true
    })

    gStateMachine = StateMachine {
        -- ['start'] = function() return StartState() end,
        ['play'] = function() return PlayState() end
    }
    gStateMachine:change('play')

    gSounds['music']:setLooping(true)
    gSounds['music']:setVolume(0.1)
    gSounds['music']:play()

    -- initialize user input
    love.keyboard.keysPressed = {}
end

function love.keypressed(key)
    -- add to our table of keys pressed this frame
    love.keyboard.keysPressed[key] = true
end

function love.keyboard.wasPressed(key)
    if love.keyboard.keysPressed[key] then
        return true
    else
        return false
    end
end

function love.update(dt)
    -- love.keyboard.keysPressed = {}
    -- GMusicPlayPos = sounds['music']:tell()

    -- loopPos = loopPos + dt
    -- if loopPos > loopDur then
    --     -- .5 to 2
    --     local r = math.random()*1.5+0.5
    --     print(r)
    --     sounds['ding']:setPitch(r)
    --     love.audio.play(sounds['ding'])
    --     loopPos = 0
    -- end
end

function love.draw()
    push:start()
    gStateMachine:render()
    push:finish()
    -- love.graphics.print("hello!", 0, 0)
    -- love.graphics.print("Music Pos" .. GMusicPlayPos, 0, 20)
    -- love.graphics.print("Loop Pos" .. loopPos, 0, 40)
end

-- https://www.reddit.com/r/gamedev/comments/13y26t/how_do_rhythm_games_stay_in_sync_with_the_music/
