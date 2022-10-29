/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./src/**/*.{html,js,svelte,ts}"],
  theme: {
    extend: {
      colors: {
        orange: "#FA9579",
        beige: "#FEF5ED",
        black: "#262525",
        lightGreen: "#D8FBD7",
        lightGrey: "#D9D9D9",
        lightPurple: "#EAC0E9",
      },
      fontSize: {
        64: "64px",
        48: "48px",
        28: "28px",
        18: "18px",
      },
      fontWeight: {
        bold: "bold",
        medium: "medium",
        regular: "regular",
        light: "light",
      },
    },
  },
  plugins: [],
};
