HealthMeter = Class{}

function HealthMeter:init()
    self.health = 0
end

function HealthMeter:delta(val)
    self.health = self.health + val
end

function HealthMeter:update(dt)

end

function HealthMeter:render()
    love.graphics.print("HEALTH: " .. tostring(self.health), VIRTUAL_WIDTH/2 - 40, VIRTUAL_HEIGHT - 40)
end
