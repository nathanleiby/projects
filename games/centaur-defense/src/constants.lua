-- size of our actual window
WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

-- size we're trying to emulate with push (40 x 22)
VIRTUAL_WIDTH = 640
VIRTUAL_HEIGHT = 352

-- 512x288
-- 640x360 or 320x180 (16:9 ... widescreen)
-- 640*352 (similar to previous but with 4px on top/bottom.. but fits 16x16 tiles nicely!
-- 320x240 (4:3 ... QVGA)


TILE_SIZE = 16

COLORS = {
  BLACK = {0, 0, 0},
  WHITE = {1, 1, 1},

  RED = {1,0,0},
  GREEN = {0, 1, 0},
  BLUE = {0, 0, 1},

  PURPLE = {1,0,1},
  YELLOW = {1,1,0},
  CYAN = {0,1,1},

  BROWN = {.65, .16, .16},
}