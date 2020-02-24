require 'src/Dependencies'



function love.load()
    print("LOAD")
    -- seed the RNG
    math.randomseed(os.time())

    -- window bar title
    love.window.setTitle('Sonic Blade')
    love.graphics.setDefaultFilter('nearest', 'nearest')


    iffy.newAtlas("assets/graphics/enemy-wizard/enemy-wizard-spritesheet.png")
    iffy.newAtlas("assets/graphics/player-wizard/wizard-attack-spritesheet.png")

    gSounds = {
        ['music'] = love.audio.newSource('assets/sounds/music.mp3', 'static'),

        -- Drum Loops
        -- TODO: Try aligning these and fading among them
        ['kip'] = love.audio.newSource('assets/sounds/drumloops/kip.ogg', 'static'),
        ['mus'] = love.audio.newSource('assets/sounds/drumloops/mus.ogg', 'static'),
        ['1Bar'] = love.audio.newSource('assets/sounds/drumloops/1Bar.ogg', 'static'),
        ['specht'] = love.audio.newSource('assets/sounds/drumloops/specht.ogg', 'static'),

        -- Pitches


    }

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        vsync = true,
        resizable = true
    })

    gStateMachine = StateMachine {
        ['start'] = function() return StartState() end,
        ['play'] = function() return PlayState() end
    }
    gStateMachine:change('play')

    local drumTrack = 'mus'
    gSounds[drumTrack]:setLooping(true)
    gSounds[drumTrack]:setVolume(0.5)
    gSounds[drumTrack]:play()

    -- initialize user input
    love.keyboard.keysPressed = {}
end

function love.resize(w, h)
    push:resize(w, h)
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
    gStateMachine:update(dt)
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
