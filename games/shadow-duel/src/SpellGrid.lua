SpellGrid = Class{}

local SZ = TILE_SIZE * 2

function SpellGrid:init()
    -- 3 (num spell types) x 8 grid (beats before impact)
    self.xOffset = TILE_SIZE*11
    self.yOffset = TILE_SIZE*10
    self.spells = {
        {0,0,0,0,0,0,0,0,0}, -- NOTE len = 9 so spell can be queued to appear..
        {0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0},
    }
end

function SpellGrid:update(dt)

end

function SpellGrid:render()
    for y=0,2 do
        for x=0,7 do
            if self.spells[y+1][x+1] == 1 then
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

function SpellGrid:addSpell()
    local y = math.random(1,3)
    print("Add spell, y =", y)
    self.spells[y][9] = 1
end

function SpellGrid:addBeat()
    for y=1,3 do
        self.spells[y][1] = 0
        for x=1,8 do
            if self.spells[y][x+1] == 1 then
                -- move the beat
                self.spells[y][x] = 1
                self.spells[y][x+1] = 0
            end
        end
    end
end