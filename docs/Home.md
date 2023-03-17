# Automated Testing Guidance

> **TLDR:** There is more to automated testing than installing a tool. Consider best practices, organization, integration of other tools and modules and test strategies.

[Scope](Scope) of this wiki

## Introduction:

The definition of [E2E UI test automation](Introduction) shouldn’t be surprising. It merely means UI testing performed with the help of a test automation tool.

UI testing, in turn, can be defined as “the process of verifying that an app’s UI not only behaves as intended but also empowers users to make the most out of it.”

Through UI testing, we can, among other things:

- verify that the app’s UI isn’t jarring or unintuitive;
- check whether input from the users is handled correctly, including if there is validation against invalid input;
- ensure that there are no spelling mistakes, capitalization inconsistencies, or even debugging messages that made it to production somehow;
- check against readability/legibility problems, including font size and colors.

We use [Cypress](https://cypress.io) as our tool as it already adopted by our community and is mature, widely used with a very active user community.

For a more detailed backstory please take a look at the extended [Getting Started](Getting-Started) page and the explanation of the [tool selection process](Tool-Choice).

## Getting Started with Cypress

We have provided an install script for Cypress which allows for a quick-and-easy set up with some key libraries. Please follow the [Install and Tool instructions](Tool-Usage)

Cypress can be implemented:

- Locally, running directly on the machine
  `npx cypress open` - To open the Test UI
  `npx cypress run` - To run the tests
- Locally, running in a docker container
- In GitHub Actions (for execution)
  See: https://github.com/bcgov/automated-testing/tree/main/.github/workflows
- In Openshift (as a separate pod or as part of CI)
  We have not addressed this in this guidance.

## Writing E2E Tests with Cypress

The **single best way** to start with Cypress is to use their free, 5 lessons course. https://learn.cypress.io/testing-your-first-application

You'll learn:

- App Install and Overview (This is the test app)
- Installing Cypress and Writing Your First Test (You might want to install with [our install procedure](Tool-Usage))
- How To Test Forms and Custom Cypress Commands
- How To Test Multiple Pages
- How To Test User Journeys (For E2E purposes this one is eesential)

or if you want to immediately get your hands dirty:
The excellent Cypress documentation site has a straightforward introduction into [Writing your first E2E Test](https://docs.cypress.io/guides/end-to-end-testing/writing-your-first-end-to-end-test).

## Running E2E Tests with Cypress

https://docs.cypress.io/guides/end-to-end-testing/testing-your-app

To execute your automated tests with Cypress, you can run them locally, through Docker, or on GitHub Actions.
Examples are provided for each of these options, making it easy to implement running on OpenShift as well. During the test run, Cypress offers console reporting that shows the test results in real-time.

- Local running: `npx cypress run`
- Github Action [Examples](https://github.com/bcgov/automated-testing/tree/main/.github/workflows)
- [Docker and Openshift Set up templates](https://github.com/bcgov/automated-testing/tree/main/tool-guidance/containers) (require work)

The preference is for running your tests locally (during development) and then in GitHub actions during your CI/CD

In addition to console reporting, Cypress also provides reporting in GitHub after a run in GitHub Actions. This is useful for tracking and analyzing test results over time. Cypress also offers reporting in the interactive test creation tool when running an individual test locally. This is helpful for debugging and identifying issues with individual tests. For more information see our page on [reporting](Reporting).

In conclusion, executing automated tests with Cypress is an essential part of the software testing process. It helps identify any issues that may not have been uncovered during unit or integration testing, ensuring that the application works as intended when used in a real-world environment. With the right setup, configuration, and reporting tools, Cypress can help you build and maintain a reliable, high-quality application that meets the needs of your users.

## Best Practices for E2E Test Automation with Cypress

Cypress has a series of best practices documented here: https://docs.cypress.io/guides/references/best-practices
They entail:

- Organizing Tests, Logging In, Controlling State
  > We have addressed this by providing the keycloak module in our set up, see https://github.com/bcgov/automated-testing/tree/main/tool-guidance/library/keycloak for guidance
- Selecting Elements
  > Targeting an element above by tag, class or id is very volatile and highly subject to change. You may swap out the element, you may refactor CSS and update ID's, or you may add or remove classes that affect the style of the element.
  > Instead, adding the _data-cy_ attribute to the element gives us a targeted selector that's only used for testing.
  > The data-cy attribute will not change from CSS style or JS behavioral changes, meaning it's not coupled to the behavior or styling of an element.
  > Add data-cy with an uniqye name to _every_ element you need to recognize, read or manipulate. This will make your scripts _very_ robust.
- Assigning Return Values
- Visiting external sites
  > Use `cy.request()` to avoid [CORS](https://en.wikipedia.org/wiki/Cross-origin_resource_sharing) problems
- Having tests rely on the state of previous tests
  > Tests should always be able to be run independently from one another and still pass.
- Creating "tiny" tests with a single assertion
  > Yeah, just don't.
- Using after or afterEach hooks
  > Clean up state before tests run. So that you always know what you have to work with. Similarly if you have to load data, you'll do that before your run.
- Unnecessary Waiting
  > Use route aliases or assertions to guard Cypress from proceeding until an explicit condition is met. Waits are sometimes neccessary, but they are the bane of automated testing and will contrubute to the fragility of your tests.
- Running Tests Intelligently
  > Time to run tests is often mentioaned as one of the largest negatives of any automated testing tool. Cypress [Smart Orchestration](https://docs.cypress.io/guides/cloud/smart-orchestration) with Cypress Cloud (Pay option) is a way out. Using a combination of parallelization, load balancing, Auto Cancellation, and Spec Prioritization, Smart Orchestration maximizes your available compute resources & minimizes waste.
- Web Servers
- Setting a global baseUrl

### Organizing your E2E Tests

Here's a suggested structure for organizing your tests in Cypress:

Folder structure: Organize your tests using the recommended folder structure provided by Cypress. By default, Cypress creates a folder called cypress in your project's root directory, which contains several subfolders:

**fixtures**: Store any static data, such as JSON files, needed for your tests.
**e2e**: Store your actual test files, organized into subfolders based on application features or sections.
**support**: Store any custom commands or reusable helper functions.
**Group related tests**: Within the cypress/e2e folder, create subfolders to group related tests based on application features or sections. For example, you might have subfolders for authentication, dashboard, user-management, etc.
**Naming conventions**: Use consistent naming conventions for your test files. One common approach is to use the format `<feature>.spec.js`, such as login.spec.js, dashboard.spec.js, or user-management.spec.js.
**Test structure**: Organize individual tests using the describe and it functions provided by Cypress. The describe function is used to group related test cases, while the it function contains the actual test case.

#### Example:

```JavaScript
describe('Login', () => {
  it('should display an error message on invalid credentials', () => {
    // Test steps
  });

  it('should log in successfully with valid credentials', () => {
    // Test steps
  });
});
```

Reusable code: Keep your test suite DRY (Don't Repeat Yourself) by creating reusable helper functions and custom commands. Store these in the cypress/support folder and import them as needed. This can help minimize duplication and make your tests easier to maintain.

Test data: Use the fixtures folder to store any static test data needed for your tests, such as sample user data or API responses. Load this data using the cy.fixture() command in your test files.

By following these recommendations, you can create a well-organized and maintainable E2E testing suite using Cypress. Remember that the key is to keep your tests clean, modular, and focused on specific features or scenarios.

A more in-depth article with examples cand be found [here](https://dzone.com/articles/cypress-test-suite-grouping-and-organizing-tests).

#### Faker Best Practice

In our install, we give you the option to install [faker-js/faker](https://www.npmjs.com/package/@faker-js/faker). We have also provided a best practice suggestion to use faker here: https://github.com/bcgov/automated-testing/tree/main/tool-guidance/library/faker

## Integrating Cypress with Other Tools and Frameworks

#### GitHub Actions

GHA is the preferred way of running your tests os part of your CI/CD Pipeline.
We have provided examples here (A simple one and a more complex one) https://github.com/bcgov/automated-testing/tree/main/.github/workflows.

Additional benefits of GHA are:

- Off-loading of work on GHA
- Reporting and Logging of results see our [Reporting](Reporting) page.
- Full configurability and tight integration with your CI/CD processes

#### Other Modules/Tools/Libraries

Review our [recipes](https://github.com/bcgov/automated-testing/tree/main/tool-guidance/recipes) page where we have summarized to tools added to our core install.

#### Cypress Testing Library

[Cypress Testing Library](https://testing-library.com/docs/cypress-testing-library/intro/) allows the use of dom-testing queries within Cypress end-to-end browser tests.

## Useful Resources

- Official Cypress Documentation: https://docs.cypress.io/
- Cypress GitHub Repository: https://github.com/cypress-io/cypress
- Cypress Example Recipes: https://github.com/cypress-io/cypress-example-recipes
- Cypress Community: https://www.cypress.io/community/

## Other related Topics

- [Browser Testing](Browser-Testing)
- [Test Automation Strategy Example](Strategy)
- [Myths, Assumptions and Misconceptions](Myths,-Assumptions-and-Misconceptions) about Test Automation
- [Behavior Driven Development](BDD)
- [Functional Test Checklist](Functional-Test-Checklist)
