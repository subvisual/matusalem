type Allocation = { name: string; val: number };
type Strategy = number[];

export function reduceStrategy(data: Allocation[]) {
  return data.reduce(
    (acc: Strategy, curr: Allocation) => {
      switch (curr.name) {
        case "rocket pool":
          return [curr.val, ...acc.slice(0, 2)];

        case "euler":
          return [acc[0], curr.val, ...acc.slice(1, 2)];

        default:
          return [acc[0], acc[1], acc[2] + curr.val];
      }
    },
    [0, 0, 0]
  );
}
