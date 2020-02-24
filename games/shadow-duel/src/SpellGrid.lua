SpellGrid = Class{}

local SZ = TILE_SIZE * 2

function SpellGrid:init()
    self.height = 3
    self.width = 8

    -- 3 (num spell types) x 8 grid (beats before impact)
    self.xOffset = TILE_SIZE*11
    self.yOffset = TILE_SIZE*10

    self.enemySpells = {}
    for y=1,self.height do
        row = {}
        for x=1,self.width do
            table.insert(row, 0)
        end
        table.insert(self.enemySpells, row)
    end
    self.enemySpellsReady= {}
    for y=1,self.height do
        table.insert(self.enemySpellsReady, 0)
    end

    self.playerSpells= {}
    for y=1,self.height do
        row = {}
        for x=1,self.width do
            table.insert(row, 0)
        end
        table.insert(self.playerSpells, row)
    end
    self.playerSpellsReady = {}
    for y=1,self.height do
        table.insert(self.playerSpellsReady, 0)
    end
end

function SpellGrid:update(dt)

end

function SpellGrid:render()
    -- Enemy Spells
    -- ? might the spells slide instead of blink their way across
    for y=0,self.height-1 do
        for x=0,self.width-1 do
            if self.enemySpells[y+1][x+1] == 1 then
                love.graphics.setColor(RAINBOW[y+1])
            elseif self.playerSpells[y+1][x+1] == 1 then
                -- TODO: make these look diff?
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
        self.playerSpellsReady[y] = 1
    else
        self.enemySpellsReady[y] = 1
    end
end

-- Move all spells one beat forward
function SpellGrid:addBeat()
    -- Enemy spells
    for y=1,self.height do
        self.enemySpells[y][1] = 0
        for x=1,self.width-1 do
            if self.enemySpells[y][x+1] == 1 then
                -- move the beat
                self.enemySpells[y][x] = 1
                self.enemySpells[y][x+1] = 0
            end
        end
        if self.enemySpellsReady[y] == 1 then
            self.enemySpells[y][self.width] = 1
            self.enemySpellsReady[y] = 0
        end
    end

    -- Player Spells
    for y=1,self.height do
        self.playerSpells[y][self.width] = 0
        for x=self.width,2,-1 do
            if self.playerSpells[y][x-1] == 1 then
                -- move the beat
                self.playerSpells[y][x] = 1
                self.playerSpells[y][x-1] = 0
            end
        end
        if self.playerSpellsReady[y] == 1 then
            self.playerSpells[y][1] = 1
            self.playerSpellsReady[y] = 0
        end
    end

    -- TODO: Check for collisions and swaps
end

function SpellGrid:getHeight()
    return self.height
end

