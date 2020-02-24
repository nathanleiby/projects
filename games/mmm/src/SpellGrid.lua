SpellGrid = Class{}

local SZ = TILE_SIZE * 2

function SpellGrid:init()
    -- height = num spell types
    self.height = 3
    -- width = num beats
    self.width = 11

    -- where is the arrow pointing?
    self.arrowHeight = 1

    self.xOffset = TILE_SIZE*8
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

    -- Draw arrow to indicate the spell the player is about to cast
    love.graphics.draw(gImages['arrow'], self.xOffset - 64 - 8, self.yOffset - 16 + ((self.arrowHeight-1) * SZ))
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
end

function SpellGrid:resolveCollisions()
    local collisions = {}
    for y=1,self.height do
        for x=1, self.width do
            if self.playerSpells[y][x] == 1 and self.enemySpells[y][x] == 1 then
                -- exact collision
                self.playerSpells[y][x] = 0
                self.enemySpells[y][x] = 0
                table.insert(collisions, {
                    x=x,
                    y=y,
                    kind='exact'
                })
            end

            if x < 8 then
                -- they swapped. now the player spells is 1 right of the enemy spell
                if self.playerSpells[y][x+1] == 1 and self.enemySpells[y][x] == 1 then
                    self.playerSpells[y][x+1] = 0
                    self.enemySpells[y][x] = 0
                    table.insert(collisions, {
                        x=x,
                        y=y,
                        kind='swap'
                    })
                end
            end
        end
    end

    return collisions
end

function SpellGrid:getHeight()
    return self.height
end

function SpellGrid:getWidth()
    return self.width
end
