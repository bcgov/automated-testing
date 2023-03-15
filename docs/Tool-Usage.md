For this testing guidance we have chosen [Cypress](https://www.cypress.io/)
> _[Cypress](https://www.browserstack.com/guide/cypress-framework-tutorial) is a modern front-end test automation framework rich with capabilities for quickly creating robust [test scenarios](https://www.browserstack.com/guide/how-to-create-test-scenarios). [Cypress framework](https://www.browserstack.com/guide/cypress-framework-tutorial) is a JavaScript-based [end-to-end testing framework](https://www.browserstack.com/guide/end-to-end-testing) built on top of Mocha – a feature-rich JavaScript test framework running on and in the browser, making asynchronous testing simple and convenient. It also uses a [BDD/TDD](https://www.browserstack.com/guide/tdd-vs-bdd-vs-atdd) assertion library and a browser to pair with any [JavaScript testing framework](https://www.browserstack.com/guide/top-javascript-testing-frameworks)._

The choice for Cypress was informed by our [research](Tool-Choice) and by a community [Survey](https://github.com/bcgov/automated-testing/blob/main/survey/Test%20Automation%20Survey.pdf).

Cypress has excellent documentation and most of the tool topics addressed in this guidance are discussed there. We will refer to those locations when needed. The guidance provided here is to help you get started with Cypress as a E2E Test Automation tool as smoothly as possible.

# Installation
To speed up installation and initial configuration of Cypress, an install script was created that allows for:
* Install JavaScript or TypeScript support
* Choose simple or advanced install (simple means no additional libraries installed)
* Install/configure the following libraries (and example code):
  * [cypress-keycloak](https://github.com/babangsund/cypress-keycloak) - To support login through our Keycloak facilities
  * [@faker-js/faker](https://fakerjs.dev/guide/) - Faker is a popular library that generates fake (but reasonable) data and is very useful in creating tests
  * [cypress-file-upload](https://www.npmjs.com/package/cypress-file-upload) - Adds a custom [Cypress](https://cypress.io/) command that allows you to make an abstraction on how exactly you upload files through HTML controls and focus on testing user workflows.
  * [cypress-plugin-api](https://github.com/filiphric/cypress-plugin-api) - Cypress plugin for effective API testing. Imagine Postman, but in Cypress. 
  * typescript - To provide Cypress TypeScript support.

## Using install.sh
To install Cypress and tools on your machine:
* copy install.sh (e.g. `curl -O https://raw.githubusercontent.com/bcgov/automated-testing/main/tool-guidance/install.sh`) to your repo (make sure you make it executable ```chmod +x install.sh```)
* Create a root directory for your tests (`testing` is good)
* Change directory to `testing`
* Run ```../install.sh```
* Answer questions
* It will generate a install file which you can run later or immediately.
* Half way through the install Cypress will open and you have to make a choice, please select E2E Testing
* Then you can choose to copy in the examples or just an empty template
* After that close Cypress browser and app
* install.sh will finish - See the [Walkthrough video of the install](https://youtu.be/yCpVLDdND8s)
* The `tool-guidance/testing` directory in this repo represents the result of running the install with all the options. _**You should always use the install procedure and not copy this directory to ensure you always install the latest versions of Cypress and libraries.**_

