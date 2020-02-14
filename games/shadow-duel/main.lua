function love.load()
    -- window bar title
    love.window.setTitle('Fight Scene')

    sounds = {}
    sounds['music'] = love.audio.newSource("sounds/music.mp3")
    sounds['ding'] = love.audio.newSource("sounds/ding.wav")

    love.audio.play(sounds['music'])

    -- seed the RNG
    math.randomseed(os.time())
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

loopDur = 2
loopPos = 0
function love.update(dt)
    love.keyboard.keysPressed = {}
    GMusicPlayPos = sounds['music']:tell()

    loopPos = loopPos + dt
    if loopPos > loopDur then
        -- .5 to 2
        local r = math.random()*1.5+0.5
        print(r)
        sounds['ding']:setPitch(r)
        love.audio.play(sounds['ding'])
        loopPos = 0
    end
end

function love.draw()
    love.graphics.print("hello!", 0, 0)
    love.graphics.print("Music Pos" .. GMusicPlayPos, 0, 20)
    love.graphics.print("Loop Pos" .. loopPos, 0, 40)
end


-- https://www.reddit.com/r/gamedev/comments/13y26t/how_do_rhythm_games_stay_in_sync_with_the_music/