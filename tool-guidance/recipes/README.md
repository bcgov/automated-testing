# Recipes

Cypress itself has excellent documentation on the tool, but it can be slightly overwhelming at first. The approach here is to get you up and running quickly and once you are getting more familiar with the tool, it is highly recommended that you explore: https://docs.cypress.io

When appropriate we'll include Cypress documentation links for further study.

The following is a list of activities to get you up and running with Cypress E2E testing.

## Install Cypress

Installing Cypress can be done by simply ```npm install cypress``` and eventhough that would work just fine, we have provided an install script that takes care of common configuration issues.

Our installation script takes care of not only installing the right libraries/extensions but also installs sample code, config files and utilities.

[A step by step description of the install process](https://github.com/bcgov/automated-testing/wiki/Tool-Usage) is included in the Wiki.

***Important: Do not clone this repo to start your test automation exercise, use the install.***

The install supports (for now):
* Install/configure the following libraries (and example code):
  * [cypress-keycloak](https://github.com/babangsund/cypress-keycloak) - To support login through our Keycloak facilities
  * [@faker-js/faker](https://fakerjs.dev/guide/) - Faker is a popular library that generates fake (but reasonable) data and is very useful in creating tests
  * [cypress-file-upload](https://www.npmjs.com/package/cypress-file-upload) - Adds a custom [Cypress](https://cypress.io/) command that allows you to make an abstraction on how exactly you upload files through HTML controls and focus on testing user workflows.
  * [cypress-plugin-api](https://github.com/filiphric/cypress-plugin-api) - Cypress plugin for effective API testing. Imagine Postman, but in Cypress. 
  * **typescript** - To provide Cypress TypeScript support.

## Run Cypress

Once the tool is installed with the ```install.sh``` script, you can quickly verify if it is operational (if you choose to install with all the sample code as per instructions) by running Cypress from the install directory: ```npx cypress run```

There will be some testing errors (in the Keycloak test), because you most likely will not have put the configuration in yet. This is OK. All other should pass.

## Open Cypress

To open the Cypress application: ```npx cypress open```

This [interactive application](https://docs.cypress.io/guides/core-concepts/cypress-app) allows you to run and debug your tests.

### First Screen
![Initial View](https://github.com/bcgov/automated-testing/raw/main/media/cypress_main.png)

### Browser Selection
![Browser Selection](https://github.com/bcgov/automated-testing/raw/main/media/cypress_browser.png)

### Spec (test scripts) List
![Spec List](https://github.com/bcgov/automated-testing/raw/main/media/cypress_speclist.png)

### Test Execution
![Execution](https://github.com/bcgov/automated-testing/raw/main/media/toolconsole.png)

## 