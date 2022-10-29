module.exports = {
  root: true,
  parser: "@typescript-eslint/parser",
  extends: [
    "eslint:recommended",
    "plugin:@typescript-eslint/eslint-recommended",
    "plugin:svelte/recommended",
    "finiam",
    "plugin:@typescript-eslint/recommended",
  ],
  ignorePatterns: ["*.cjs"],
  parserOptions: {
    sourceType: "module",
    ecmaVersion: 2020,
  },
  env: {
    browser: true,
    es2017: true,
    node: true,
  },
  rules: {
    "import/no-unresolved": 0,
    "import/prefer-default-export": 0,
    "import/no-extraneous-dependencies": 0,
    "no-return-assign": 0,
  },
  overrides: [
    {
      files: ["*.svelte"],
      parser: "svelte-eslint-parser",
      parserOptions: {
        parser: "@typescript-eslint/parser",
      },
      rules: {
        "import/prefer-default-export": 0,
        "import/no-mutable-exports": 0,
        "no-inner-declarations": 0,
        "svelte/max-attributes-per-line": [
          "error",
          {
            multiline: 1,
            singleline: 1,
          },
        ],
      },
    },
  ],
};
