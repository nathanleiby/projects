SpellGrid = Class{}

local SZ = TILE_SIZE * 2

function SpellGrid:init()
    self.height = 3
    -- 3 (num spell types) x 8 grid (beats before impact)
    self.xOffset = TILE_SIZE*11
    self.yOffset = TILE_SIZE*10
    self.enemySpells = {
        {0,0,0,0,0,0,0,0,0}, -- NOTE len = 9 so spell can be queued to appear..
        {0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0},
    }
    self.playerSpells= {
        {0,0,0,0,0,0,0,0,0}, -- NOTE len = 9 so spell can be queued to appear..
        {0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0},
    }
    -- ? might the spells slide instead of blink their way across
end

function SpellGrid:update(dt)

end

function SpellGrid:render()
    -- Enemy Spells
    for y=0,self.height-1 do
        for x=0,7 do
            if self.enemySpells[y+1][x+1] == 1 then
                love.graphics.setColor(RAINBOW[y+1])
            else
                love.graphics.setColor(COLORS.WHITE)
            end
            love.graphics.rectangle('fill', self.xOffset + x*SZ, self.yOffset + y*SZ, SZ, SZ)
            love.graphics.setColor(COLORS.BLACK)
            love.graphics.rectangle('line', self.xOffset + x*SZ, self.yOffset + y*SZ, SZ, SZ)
        end
    end

    -- Player Spells
    for y=0,self.height-1 do
        for x=0,7 do
            if self.enemySpells[y+1][x+1] == 1 then
                love.graphics.setColor(RAINBOW[y+1])
            else
                love.graphics.setColor(COLORS.WHITE)
            end
            love.graphics.rectangle('fill', self.xOffset + x*SZ, self.yOffset + y*SZ, SZ, SZ)
            love.graphics.setColor(COLORS.BLACK)
            love.graphics.rectangle('line', self.xOffset + x*SZ, self.yOffset + y*SZ, SZ, SZ)
        end
    end

    love.graphics.setColor(COLORS.WHITE)
end

function SpellGrid:addSpell(who, y)
    if who == 'player' then
        self.playerSpells[y][1] = 1
    else
        self.enemySpells[y][9] = 1
    end
end


function SpellGrid:addBeat()
    for y=1,self.height do
        self.enemySpells[y][1] = 0
        for x=1,8 do
            if self.enemySpells[y][x+1] == 1 then
                -- move the beat
                self.enemySpells[y][x] = 1
                self.enemySpells[y][x+1] = 0
            end
        end
    end
end

function SpellGrid:getHeight()
    return self.height
end

