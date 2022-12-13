import { defineConfig } from 'cypress'

export default defineConfig({
  // These settings apply everywhere unless overridden
  defaultCommandTimeout: 5000,
  viewportWidth: 1920,
  viewportHeight: 1080,
  // Command timeout overridden for E2E tests
  e2e: {
    defaultCommandTimeout: 10000
  }
})
