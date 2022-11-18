export function genId(array: Record<string, any>[], idProp: string) {
  return Number(array[array.length - 1]?.[idProp] || 0) + 1;
}
