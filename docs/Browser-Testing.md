# Browser Testing

Cypress has the capability to run tests across multiple browsers. Currently, it has support for Chrome-family browsers (including Electron and Chromium-based Microsoft Edge), and Firefox.

**Caveat:**
Excluding Electron, any browser you want to run tests with needs to be installed on your local system or CI environment. This can be potentially challenging to make work properly.

A viable alternative is [BrowserStack](https://www.browserstack.com/), which will allow you to run your scripts against 3000 platform/browser variants. BrowserStack is free for Open Source projects.
A quick introduction can be found [here](https://www.browserstack.com/docs/automate/cypress).
