# Automated Testing Guidance

[Scope](Scope) of this wiki.

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

> Explain how to write and organize test cases using Cypress.
> Describe how to use the Cypress Test Runner to execute and debug tests.
> Provide examples of how to write common E2E tests, such as login/logout, form submission, and navigation.

- [Building Tests](Building-Tests)

## Running E2E Tests with Cypress

- [Executing Tests](Executing-Tests)
- [Reporting](Reporting)

## Best Practices for E2E Test Automation with Cypress

> Provide guidelines for writing effective and maintainable E2E tests with Cypress.
> Discuss how to structure test suites and use Cypress commands and assertions effectively.
> Cover how to manage test data, handle asynchronous operations, and use fixtures and mocks.

## Integrating Cypress with Other Tools and Frameworks

> Explain how to integrate Cypress with Continuous Integration (CI) and Continuous Deployment (CD) pipelines.
> Cover how to use Cypress with other testing tools and frameworks, such as Mocha, Chai, and Jest.
> Discuss how to use Cypress with popular frontend frameworks, such as React.

## Troubleshooting and Debugging E2E Tests with Cypress

Explain how to identify and resolve common issues and errors that may occur when writing and executing E2E tests with Cypress.
Cover how to debug tests using the Cypress Test Runner and browser developer tools.
Discuss how to handle flaky tests and improve test stability and reliability.

## Other related Topics

- [Browser Testing](Browser-Testing)
- [Test Automation Strategy Example](Strategy)
- [Myths, Assumptions and Misconceptions](Myths,-Assumptions-and-Misconceptions) about Test Automation
- [Behavior Driven Development](BDD)
- [Functional Test Checklist](Functional-Test-Checklist)
