# Recipes

Cypress itself has excellent documentation on the tool, but it can be slightly overwhelming at first. The approach here is to get you up and running quickly and once you are getting more familiar with the tool, it is highly recommended that you explore: https://docs.cypress.io

When appropriate we'll include Cypress documentation links for further study.

The following is a list of activities to get you up and running with Cypress E2E testing.

## Install Cypress

Installing Cypress can be done by simply `npm install cypress` and eventhough that would work just fine, we have provided an install script that takes care of common configuration issues.

Our installation script takes care of not only installing the right libraries/extensions but also installs sample code, config files and utilities.

[A step by step description of the install process](https://github.com/bcgov/automated-testing/wiki/Tool-Usage) is included in the Wiki.

**_Important: Do not clone this repo to start your test automation exercise, use the install._**

The install supports (for now):

- Install/configure the following libraries (and example code):
  - [cypress-keycloak](https://github.com/babangsund/cypress-keycloak) - To support login through our Keycloak facilities
  - [@faker-js/faker](https://fakerjs.dev/guide/) - Faker is a popular library that generates fake (but reasonable) data and is very useful in creating tests
  - [cypress-file-upload](https://www.npmjs.com/package/cypress-file-upload) - Adds a custom [Cypress](https://cypress.io/) command that allows you to make an abstraction on how exactly you upload files through HTML controls and focus on testing user workflows.
  - [cypress-plugin-api](https://github.com/filiphric/cypress-plugin-api) - Cypress plugin for effective API testing. Imagine Postman, but in Cypress.
  - **typescript** - To provide Cypress TypeScript support.

## Run Cypress

Once the tool is installed with the `install.sh` script, you can quickly verify if it is operational (if you choose to install with all the sample code as per instructions) by running Cypress from the install directory: `npx cypress run`

There will be some testing errors (in the Keycloak test), because you most likely will not have put the configuration in yet. This is OK. All other should pass.

## Open Cypress

To open the Cypress application: `npx cypress open`

This [interactive application](https://docs.cypress.io/guides/core-concepts/cypress-app) allows you to run and debug your tests.

### First Screen

![Initial View](https://github.com/bcgov/automated-testing/raw/main/media/cypress_main.png)

### Browser Selection

![Browser Selection](https://github.com/bcgov/automated-testing/raw/main/media/cypress_browser.png)

### Spec (test scripts) List

![Spec List](https://github.com/bcgov/automated-testing/raw/main/media/cypress_speclist.png)

### Test Execution

![Execution](https://github.com/bcgov/automated-testing/raw/main/media/toolconsole.png)

## Using Keycloak

BCGOV is using Keycloak for many of its new applications. Keycloak is an open source software product to allow single sign-on with Identity and Access Management.

A typical test scenario does include a login into the system. Now we can fairly easily create scripts that go through the motions of manually login through the UI, but this is actually indicated as an anti-pattern when developing test automation scripts.

First of all, this is very slow, secondly it can be error prone. Therefore a better solution is to connect directly to Keycloak providing the correct parameters and authenticate the session. For this purpose a library component was developed that does exactly this in a very straightforward manner. See: https://www.npmjs.com/package/cypress-keycloak

We have included the set up and configuration of this package in our install script. Please find a detailed usage explanation [here](https://github.com/bcgov/automated-testing/blob/main/tool-guidance/library/keycloak/README.md).

## Using Faker

We are using the [@faker-js/faker](https://www.npmjs.com/package/@faker-js/faker) package to generate fake but realistic test data in our tests. Detailed documentation on all the options can be found at https://fakerjs.dev/guide/.

The install procedure installs/configures the faker package and sample script. For more details on usage in our environment see [here](https://github.com/bcgov/automated-testing/blob/main/tool-guidance/library/faker/README.md).

## Using File Upload

We are providing the install for using the file upload package. Cypress does not natively support an easy way to support uploads to HTML5 controls.

This [package](https://www.npmjs.com/package/cypress-file-upload) adds a custom Cypress command that allows you to make an abstraction on how exactly you upload files through HTML controls and focus on testing user workflows.

Some examples are discussed [here](https://github.com/bcgov/automated-testing/blob/main/tool-guidance/library/file-upload/README.md).

## Testing APIs

Eventhough Cypress, OOTB, does support connecting to API services and issue command, we have included a package that makes working with APIs significantly easier.

There are other viable tools to test APIs like [Postman](https://www.postman.com/), but it might be advantageous to use Cypress to either connect to APIs or execute some simple tests without having to switch to another tool.

We use the [cypress-plugin-api](https://www.npmjs.com/package/cypress-plugin-api) to smooth out working wit APIs.
It is labelled the Cypress plugin for effective API testing. Imagine Postman, but in Cypress. Prints out information about the API call in the Cypress App UI.

More details on our implemenation can be found [here](https://github.com/bcgov/automated-testing/blob/main/tool-guidance/library/api/README.md).

## Cypress Testing Library

Cypress Testing Library allows the use of dom-testing queries within Cypress end-to-end browser tests.
More details on our implemenation can be found [here](https://github.com/bcgov/automated-testing/blob/main/tool-guidance/library/cypress_testing_library/README.md).

The @testing-library family of packages helps you test UI components in a user-centric way. The core library, [DOM Testing Library](https://testing-library.com/docs/), is a light-weight solution for testing web pages by querying and interacting with DOM nodes (whether simulated with JSDOM/Jest or in the browser). The main utilities it provides involve querying the DOM for nodes in a way that's similar to how the user finds elements on the page. In this way, the library helps ensure your tests give you confidence that your application will work when a real user uses it.

The core library has been wrapped to provide ergonomic APIs for several frameworks, including React, Angular, and Vue.
We use testing-library queries for end-to-end tests in Cypress and an implementation for [React Native](https://testing-library.com/docs/react-native-testing-library/intro).
