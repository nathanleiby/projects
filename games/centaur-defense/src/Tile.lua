Tile = Class{}

local TILE_SIZE = 16

local COLORS = {
  RED = {1, 0, 0},
  GREEN = {0, 1, 0},
  BLUE = {0, 0, 1},
  BROWN = {.65, .16, .16},
  WHITE = {1, 1, 1},
}

local KIND = {
    grass = {
        color = COLORS.GREEN,
    },
    water = {
        color = COLORS.BLUE,
    },
    path = {
        color = COLORS.BROWN,
    }
}

function Tile:init(mapX, mapY)
  self.mapX = mapX
  self.mapY = mapY

  -- determine tile type
  local r = math.random()
  if r < .8 then 
    self.kind = "grass"
  else
    self.kind = "water"
  end
end

function Tile:render()
    local x = (self.mapX -1) * TILE_SIZE
    local y = (self.mapY - 1) * TILE_SIZE

    love.graphics.setColor(KIND[self.kind].color)
    -- love.graphics.rectangle('fill', x+1, y+1, TILE_SIZE-1, TILE_SIZE-1)
    love.graphics.rectangle('fill', x, y, TILE_SIZE, TILE_SIZE)
    love.graphics.setColor(COLORS.WHITE)
end