> **TLDR:** Automated testing for UI tests against web applications, such as End-to-End (E2E) testing, requires an understanding of purpose, scope, strategy, planning, tools, implementation, execution, and reporting. E2E testing is important to ensure that the application works as intended in a real-world environment, and Cypress is a commonly used tool for automated E2E testing.

Automated testing requires an understanding of:
* Purpose and scope
* Strategy
* Planning
* Tools
* Implementation
* Execution
* Reporting

# Purpose and scope
In this wiki we are talking about automation of UI tests against web applications, most likely deployed as [E2E (End-To-End)](https://www.browserstack.com/guide/end-to-end-testing) or smoke tests (there are other usages but that is not the focus for this guidance). [What is Test Automation?](Introduction)

## What is End-To-End Testing?
End-to-end testing (E2E testing) is a type of software testing that involves testing a complete application environment in a situation that mimics real-world use. The purpose of E2E testing is to identify system dependencies and to ensure that the data integrity is maintained from start to finish.

E2E testing is typically performed on an application after it has been integrated, to ensure that it works as intended with all its components and dependencies. It is a critical part of the software testing process, as it helps to ensure that the application is reliable and functions correctly in a real-world environment.

E2E tests can be automated or manual. Automated E2E tests are typically created using a combination of testing frameworks and tools, such as Cypress. These tests are run on a continuous integration server, allowing developers to quickly identify and fix issues as they arise. Manual E2E tests involve a human tester manually testing the application and its features to ensure they work as expected.

E2E testing is important because it helps to identify any issues that may not have been uncovered during unit or integration testing. It also helps to ensure that the application works as intended when used in a real-world environment, giving users confidence in the stability and reliability of the application.

# Strategy
In agile projects, test automation is essential to build, integrate, test and deploy an application with production-like quality every day. Agile projects have limited time to conduct existing regression tests manually so they depend on accurate automated regression testing in order to maintain effective progress. Test automation is seen as **a key enabler** for Agile projects, especially when practices like continuous integration are used. 

A level of strategizing and planning is necessary to achieve a high level of value for an appropriate amount of effort.
Included here is a [sample strategy](Strategy) that will help you pull your plan together.

# Planning

The steps below are required (either explicitly or as part of your thinking process) to initiate and complete any E2E test.
1. Analyze requirements. Have a clear idea of how the app is supposed to work in every aspect
1. Set up a test environment in alignment with all the requirements
1. Analyze software and hardware requirements
1. List down how every system needs to respond
1. List down testing methods required to test these responses. 
1. Design test cases
1. Build automated test scripts
1. Run tests, study and save results

Rinse and Repeat

# Tools
Within the context of this guidance we are talking about Automated E2E Testing. The tool most favoured in our community is [Cypress](https://cypress.io).
> _[Cypress](https://www.browserstack.com/guide/cypress-framework-tutorial) is a modern front-end test automation framework rich with capabilities for quickly creating robust [test scenarios](https://www.browserstack.com/guide/how-to-create-test-scenarios). [Cypress framework](https://www.browserstack.com/guide/cypress-framework-tutorial) is a JavaScript-based [end-to-end testing framework](https://www.browserstack.com/guide/end-to-end-testing) built on top of Mocha – a feature-rich JavaScript test framework running on and in the browser, making asynchronous testing simple and convenient. It also uses a [BDD/TDD](https://www.browserstack.com/guide/tdd-vs-bdd-vs-atdd) assertion library and a browser to pair with any [JavaScript testing framework](https://www.browserstack.com/guide/top-javascript-testing-frameworks)._

Cypress does provide excellent documentation online, we'll point to relevant pages when needed.

# Implementation
Set up and configuration of this tool is addressed [here](Tool-Usage).
The tool runs on any node supported platform and offers a full suite of functionality needed to effectively build and run automated tests.

# Execution
Examples are provided for running locally, through Docker and on GitHub Actions. With these example you could fairly easily implement running on OpenShift as well.

# Reporting

Cypress offers the following possibilities:
1. Console reporting during the test run (local/CI)
2. Reporting in GitHub after a run in GitHub Actions
3. Reporting in the interactive test creation tool, when running an individual test locally.
4. Reporting through the company's free (for Open Source projects) online reporting tool
5. The company's dashboarding and reporting tool does allow integration with Jira, Slack, GitHub and others (for a price)
6. Integrate Test results into [Allure](https://github.com/allure-framework) and [TestLink](https://github.com/TestLinkOpenSourceTRMS/testlink-code) (Open Source Test reporting and Test Management tools)

For advanced reporting options with Cypress, please check [here](https://docs.cypress.io/guides/tooling/reporters). We will focus on the out-of-box capabilities.

For details see [here](Reporting).