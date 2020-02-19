Tile = Class{}

local scale = 0.25 -- 64px => 16px

local KIND = {
    grass = {
        color = COLORS.GREEN,
        sprite =  "medievalTile_57.png"
    },
    water = {
        color = COLORS.BLUE,
        sprite =  "medievalTile_27.png"
    },
    path = {
        color = COLORS.BROWN,
        sprite =  "medievalTile_04.png"
    }
}

function Tile:init(mapX, mapY, kind)
  self.mapX = mapX
  self.mapY = mapY

  -- determine tile type
  if kind then 
    self.kind = kind
  else
    -- random kind
    local r = math.random()
    if r < .8 then 
      self.kind = "grass"
    else
      self.kind = "water"
    end
  end
end

function Tile:render()
    local x = (self.mapX -1) * TILE_SIZE
    local y = (self.mapY - 1) * TILE_SIZE

    -- love.graphics.setColor(KIND[self.kind].color)
    -- love.graphics.rectangle('fill', x, y, TILE_SIZE, TILE_SIZE)
    -- love.graphics.setColor(COLORS.WHITE)

    iffy.drawSprite(KIND[self.kind].sprite, x, y, 0, scale, scale)
end