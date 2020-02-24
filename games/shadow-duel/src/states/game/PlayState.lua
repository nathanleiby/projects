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
    self.score = 0
    self.background = Background()
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
end


function PlayState:update(dt)
    self.background:update(dt)

    self.player.input:update()
    local input = self.player.input
    -- local x, y = input:get('move')
    if input:pressed('action') and not self.playerAttackedThisBeat then
        self.player:attack()
        self.spellgrid:addSpell('player', math.random(1,self.spellgrid:getHeight()))
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

    -- FOREGROUND
    -- render players last
    self.spellgrid:render()
    self.player:render()
    self.enemy:render()

    love.graphics.print("Score: " .. self.score, VIRTUAL_WIDTH-70, 20)
    love.graphics.setColor(COLORS.WHITE)
end
