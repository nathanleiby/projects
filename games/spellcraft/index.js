const svg = document.getElementById("svg");
const rc = rough.svg(svg);

const OFFSET = 0;
const SQUARE_WIDTH = 100;

const radius = SQUARE_WIDTH / 2;

const points = [
  [1, 0, 1],
  [1, 0, 0],
  [1, 0, 1],
];

function neighbors(row, col) {
  const ns = [
    [row + 1, col],
    [row - 1, col],
    [row, col + 1],
    [row, col - 1],
  ];

  // return in-bounds points
  const bound = points.length;
  return ns.filter(
    (p) => p[0] >= 0 && p[0] < bound && p[1] >= 0 && p[1] < bound
  );
}

for (let row = 0; row < points.length; row++) {
  for (let col = 0; col < points[row].length; col++) {
    const x = row * SQUARE_WIDTH;
    const y = col * SQUARE_WIDTH;
    svg.appendChild(
      rc.rectangle(x, y, SQUARE_WIDTH, SQUARE_WIDTH, {
        // fill: "red",
        stroke: "lightgray",
        fill: "lightgray",
        hachureAngle: 60,
        hachureGap: 10,
        fillWeight: 0.5,
        strokeWidth: 2,
      })
    );
  }
}

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
        svg.appendChild(rc.line(x, y, nx, ny, { strokeWidth: 5 }));
      });

      console.log({ x, y, validNeighborCount });
      if (validNeighborCount <= 1) {
        svg.appendChild(
          rc.circle(x, y, radius, {
            stroke: "red",
            strokeWidth: 2,
            fill: "rgba(0,255,0,0.3)",
            fillStyle: "solid",
          })
        );
      }
    }
  }
}

function download() {
  svgExport.downloadSvg(
    document.getElementById("svg"), // SVG DOM Element object to be exported. Alternatively, a string of the serialized SVG can be passed
    "svg", // chart title: file name of exported image
    { width: 300, height: 300 } // options (optional, please see below for a list of option properties)
  );
}

download();
