function love.load()
    -- window bar title
    love.window.setTitle('Fight Scene')

    GMusic = love.audio.newSource("sounds/music.mp3")
    love.audio.play(GMusic)

    GMusic = love.audio.newSource("sounds/ding.wav")

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

function love.update(dt)
    love.keyboard.keysPressed = {}
    GMusicPlayPos = GMusic:tell()
end

function love.draw()
    love.graphics.print("hello!", 0, 0)
    love.graphics.print(GMusicPlayPos, 0, 20)
end


-- https://www.reddit.com/r/gamedev/comments/13y26t/how_do_rhythm_games_stay_in_sync_with_the_music/