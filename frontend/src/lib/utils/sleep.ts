const sleep = async (time: number) =>
  // eslint-disable-next-line no-promise-executor-return
  new Promise((res) => setTimeout(res, time));

export default sleep;
