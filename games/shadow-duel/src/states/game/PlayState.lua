PlayState = Class{__includes = BaseState}

local r1 = {0, 0, 0, 0, 1, 0, 0, 0}
local r2 = {1, 0, 1, 1, 0, 0, 0, 0}
local r3 = {0, 1, 0, 1, 0, 1, 0, 1}
local rhythms = {r1, r2, r3}

local drumTracks = {
    'kip',
    'mus',
    '1Bar', -- make the game feel double speed. excite!
    'specht',
    'struis',
    'koekkoek',
    'drinkvogel',
}

local BEATS_PER_LOOP = 8

function PlayState:init()
    self.background = Background()
    self.healthmeter = HealthMeter()
    self.player = Player()
    self.enemy = Enemy()
    self.spellgrid = SpellGrid()

    self.rhythm = lume.randomchoice(rhythms)
    self.drumTrack = lume.randomchoice(drumTracks)
    self.loopDur = gSounds[self.drumTrack]:getDuration()
    self:resetLoop()
    gSounds[self.drumTrack]:setLooping(true)
    gSounds[self.drumTrack]:setVolume(0.1)
    gSounds[self.drumTrack]:play()

    -- player can only attack once per beat
    self.playerAttackedThisBeat = false
    self.arrowHeight = 1
end


function PlayState:update(dt)
    self.background:update(dt)

    self.player.input:update()
    local input = self.player.input
    -- local x, y = input:get('move')
    if input:pressed('up') or input:pressed('down') then
        if input:pressed('up') then
            self.arrowHeight = self.arrowHeight - 1
        else
            self.arrowHeight = self.arrowHeight + 1
        end
        -- update spellgrid for rendering purposes
        self.spellgrid.arrowHeight = self.arrowHeight
    end

    if input:pressed('action') and not self.playerAttackedThisBeat then
        self.player:attack()
        self.spellgrid:addSpell('player', self.arrowHeight)
        self.playerAttackedThisBeat = true
    end

    self.player:update(dt)
    self.enemy:update(dt)

    -- Enemy attacks
    self.loopPos = self.loopPos + dt
    if self.loopPos > self.loopDur then
        self:resetLoop()
    end

    if self.loopPos > self.nextBeatPos then
        -- quarter note rhythms
        if self.rhythm[self.nextBeatNum + 1] > 0 then
            self.enemy:attack()
            self.spellgrid:addSpell('enemy', math.random(1,self.spellgrid:getHeight()))
        end
        self.nextBeatPos = self.nextBeatPos + (self.loopDur / BEATS_PER_LOOP)
        self.nextBeatNum = self.nextBeatNum + 1
        self.playerAttackedThisBeat = false
        self.spellgrid:addBeat()
        local collisions = self.spellgrid:resolveCollisions()
        for _, c in pairs(collisions) do
            -- TODO: handle exact vs swap differently
            -- update health
            local midpt = math.ceil(self.spellgrid:getWidth()/2)
            if c.x > midpt then
                -- Push toward the enemy
                self.healthmeter:delta(1)
            elseif c.x < midpt then
                -- push toward the player
                self.healthmeter:delta(-1)
            else
                -- if they meet in the exact middle..
                -- TODO: something special or just zeroed out
            end
        end
    end
end

function PlayState:resetLoop()
    self.loopPos = 0
    self.nextBeatPos = 0
    self.nextBeatNum = 0
end

function PlayState:render()
    -- self.gameMap:render()
    -- BACKGROUND
    self.background:render()
    self.healthmeter:render()

    -- FOREGROUND
    -- render players last
    self.spellgrid:render()
    self.player:render()
    self.enemy:render()
end
