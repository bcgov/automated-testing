const { defineConfig } = require("cypress");

module.exports = defineConfig({
  projectId: '4c5wm1',
  e2e: {
    setupNodeEvents(on, config) {
      // implement node event listeners here
    },
  },
});
