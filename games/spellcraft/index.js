const canvas = document.getElementById("canvas");
const rc = rough.canvas(canvas);

const OFFSET = 0;
const SQUARE_WIDTH = 100;

const radius = SQUARE_WIDTH / 2;

const spells = [
  // alien
  [
    [0, 1, 0],
    [1, 1, 1],
    [0, 1, 1],
  ],
  // zig zag
  [
    [0, 1, 1],
    [1, 1, 0],
    [1, 0, 0],
  ],
  // eight
  [
    [1, 1, 0],
    [1, 1, 1],
    [0, 1, 1],
  ],
  // antennae
  [
    [0, 1, 0],
    [1, 1, 1],
    [1, 1, 1],
  ],
  // galaga / slingshot / "y"
  [
    [1, 0, 1],
    [1, 1, 1],
    [0, 1, 0],
  ],
  // short u
  [
    [1, 0, 1],
    [1, 1, 1],
    [0, 0, 0],
  ],
  // square
  [
    [1, 1, 0],
    [1, 1, 0],
    [0, 0, 0],
  ],
  // line
  [
    [0, 1, 0],
    [0, 1, 0],
    [0, 1, 0],
  ],
  // cross
  [
    [0, 1, 0],
    [1, 1, 1],
    [0, 1, 0],
  ],
  // H
  [
    [1, 0, 1],
    [1, 1, 1],
    [1, 0, 1],
  ],
  // mini vert line
  [
    [0, 1, 0],
    [0, 1, 0],
    [0, 0, 0],
  ],

  // non 3x3 experiments... (TODO: needs to update the canvas size for each of these)
  // line vertical
  [[1], [1], [1]],
  // line horiz
  [[1, 1, 1]],
  // smaller square
  [
    [1, 1],
    [1, 1],
  ],
];

// which spell?
const spellIdx = 10;
const points = spells[spellIdx];

function neighbors(row, col) {
  const ns = [
    [row + 1, col],
    [row - 1, col],
    [row, col + 1],
    [row, col - 1],
  ];

  // return in-bounds points
  const rowBound = points.length;
  const colBound = points[0].length;
  return ns.filter(
    (p) => p[0] >= 0 && p[0] < rowBound && p[1] >= 0 && p[1] < colBound
  );
}

function draw() {
  // white background (not transparent)
  var ctx = canvas.getContext("2d");
  ctx.fillStyle = "white";
  ctx.fillRect(0, 0, canvas.width, canvas.height);

  // draw grid (gray squares in background)
  for (let row = 0; row < points.length; row++) {
    for (let col = 0; col < points[row].length; col++) {
      const y = row * SQUARE_WIDTH;
      const x = col * SQUARE_WIDTH;
      // svg.appendChild(
      rc.rectangle(x, y, SQUARE_WIDTH, SQUARE_WIDTH, {
        // fill: "red",
        stroke: "lightgray",
        fill: "lightgray",
        hachureAngle: 60,
        hachureGap: 10,
        fillWeight: 0.5,
        strokeWidth: 2,
      });
      // );
    }
  }

  // draw spell (lines and nodes)
  for (let row = 0; row < points.length; row++) {
    for (let col = 0; col < points[row].length; col++) {
      const element = points[row][col];
      if (element == 1) {
        // if endpoint, draw a circle
        const x = (col + 1 - 0.5) * SQUARE_WIDTH;
        const y = (row + 1 - 0.5) * SQUARE_WIDTH;

        // draw connections
        let validNeighborCount = 0;
        neighbors(row, col).forEach((n) => {
          const nrow = n[0];
          const ncol = n[1];
          if (points[nrow][ncol] !== 1) {
            return;
          }
          validNeighborCount++;

          const nx = (ncol + 1 - 0.5) * SQUARE_WIDTH;
          const ny = (nrow + 1 - 0.5) * SQUARE_WIDTH;
          rc.line(x, y, nx, ny, { strokeWidth: 5 });
          // svg.appendChild();
        });

        console.log({ x, y, validNeighborCount });
        if (validNeighborCount <= 1) {
          // svg.appendChild(
          rc.circle(x, y, radius, {
            stroke: "red",
            strokeWidth: 2,
            fill: "rgba(0,255,0,0.3)",
            fillStyle: "solid",
          });
          // );
        }
      }
    }
  }
}

draw();

function downloadImage() {
  console.log(canvas.toDataURL());

  var link = document.createElement("a");
  link.download = `spell-${spellIdx}.png`;
  link.href = canvas.toDataURL();
  link.click();
  link.delete;
}

const download = document.getElementById("download");
download.addEventListener("click", function (e) {
  downloadImage();
});

// downloadImage();
