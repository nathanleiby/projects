require 'src/Dependencies' 

local isFullscreen = false

iffy.newAtlas("assets/graphics/kenney_medievalRTSpack/Spritesheet/medievalRTS_spritesheet.png")

function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')
    -- love.graphics.setFont(gFonts['medium'])
    love.window.setTitle('Centaur Defense')

    math.randomseed(os.time())
    
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

    -- gSounds['music']:setLooping(true)
    -- gSounds['music']:setVolume(0.5)
    -- gSounds['music']:play()

end

function love.resize(w, h)
    push:resize(w, h)
end

function love.keypressed(key)
    if key == 'escape' then
        -- TODO: pop-up a "want to exit" or menu instead
        love.event.quit()
    end

    if key == 'f11' then
        -- Toggle full-screen mode
        isFullscreen = not isFullscreen
        love.window.setFullscreen(isFullscreen, 'desktop')
        love.resize(love.graphics.getWidth(), love.graphics.getHeight())
    end

    love.keyboard.keysPressed[key] = true
end

function love.keyboard.wasPressed(key)
    return love.keyboard.keysPressed[key]
end

function love.update(dt)
    gStateMachine:update(dt)

    love.keyboard.keysPressed = {}
end

function love.draw()
    push:start()
    gStateMachine:render()
    push:finish()
end