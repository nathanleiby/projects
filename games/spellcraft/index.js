const svg = document.getElementById("svg");
const rc = rough.svg(svg);

const OFFSET = 0;
const SQUARE_WIDTH = 100;

const radius = SQUARE_WIDTH / 2;

const points = [
  [1, 0, 0],
  [1, 1, 1],
  [1, 0, 0],
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
      if (validNeighborCount === 1) {
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

// //line and rectangle
// svg.appendChild(rc.line(50, 50, 150, 50, { strokeWidth: 5 }));
// svg.appendChild(rc.rectangle(10, 10, 100, 100));
// svg.appendChild(
//   rc.rectangle(140, 10, 100, 100, {
//     fill: "rgba(255,0,0,0.2)",
//     fillStyle: "solid",
//     roughness: 2,
//   })
// );
// svg.appendChild(
//   rc.rectangle(10, 130, 100, 100, {
//     fill: "red",
//     stroke: "blue",
//     hachureAngle: 60,
//     hachureGap: 10,
//     fillWeight: 5,
//     strokeWidth: 5,
//   })
// );

// // ellipse and circle
