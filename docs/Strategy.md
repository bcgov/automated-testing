# Test Automation Strategy/Plan

_The following is an **example** of a strategy/plan that addresses common decisions and choices that need to be made when thinking about test automation. Here we do address all automation activities even though the scope in this guidance is mostly focused on UI Test Automation._

In agile projects, test automation is essential to build, integrate, test and deploy an application with production-like quality every day. Agile projects have limited time to conduct existing regression tests manually so they depend on accurate automated regression testing in order to maintain effective progress. Test automation is seen as a key enabler for Agile projects, especially when practices like continuous integration are used. It also enables the test team to test aspects of the application that could either be very cumbersome or not possible in a manual test.

## Definition

Automated software testing is a process in which software tools execute pre-scripted tests on a software application before it is released into production.

## Objectives

The objective of automated testing is to simplify as much of the testing effort as possible with a minimum set of scripts. Automated testing tools are capable of executing tests, reporting outcomes and comparing results with earlier test runs. Tests carried out with these tools can be run repeatedly, at any time of day.

Specifically test automation aims to:

- Automate  **all**  Unit and Integration tests, so that they can be run as part of the automated build process (CI)
- Provide automated functional tests, that will be used to regression test the solution on a ongoing basis
- Provide in depth testing in cases where a large number of variants needs to be tested
- Enable performance testing

### Expected Benefits

The following benefits are expected from test automation:

- Consistent Functional Regression Testing
- Consistent and frequent smoke testing
- Prove that new changes did not break the application
- Consistency and predictability of results
- Ability to test more variants efficiently
- Ability to do more testing in the same amount of time
- Free up the testers to focus on complex test situations and expand on the test design
- Build up of a body of tests that will repeatedly runs over the lifetime of the application

## Scope

The scope of test automation in an agile project is potentially wide:

**Activity** | **Test Automation Activity** | **Description** | **Responsibility** 
--- | --- | --- | --- 
Unit Testing | Automated Unit Tests + Coverage | Developers create Unit test scripts that they initially will execute on their own workstation. These scripts are also executed as part on the continuous integration and build processes. These tests will also yield test coverage results and the test results for later consumption. | Developers 
Integration Testing | Automated Unit Tests | Developers create Unit test scripts that they initially will execute on their own workstation. These scripts will differ from the unit test scripts as these scripts will assume the integration of the unit under test with other units. These scripts are also executed as part on the continuous integration and build processes. | Developers
| | Automated Tests | Developers create test scripts that they initially will execute on their own workstation. These scripts differ from the unit test scripts and the earlier mentioned integration test scripts as these scripts test the integration with external systems. These scripts are also executed as part on the continuous integration and build processes. | Developers
Functional Testing | Automated Functional Tests | The test automation specialist develops a**utomated functional tests based on the test design and test ideas** developed by the test group. The automated functional tests are used to create automated regression test suites that are repeatedly run during the sprints and the lifetime of the application. | Test Automation Specialist
| |Automated Functional Tests | The test automation specialist develops **automated high volume/many variants functional tests** based on the test design and test ideas developed by the test group. These tests are typically not candidates for the regression test suite as they are meant for intensive time-consuming in depth tests | Test Automation Specialist
| |Automated Functional Tests | The test automation specialist develops **automated functional smoke tests** based on the test design and test ideas developed by the test group. These tests are used on an ongoing basis during the sprints and the lifetime of the application. | Test Automation Specialist |
| Performance Testing | Performance Test | The test automation specialist develops user simulation scripts that will be used for performance and load testing. | Test Automation Specialist

## Approach

Test automation forms the core of the test exercise and is, as mentioned before, a key enabler for the agile project. That is why a large amount of test activity is geared towards feeding the test automation development.

The following activities feed into test automation development:

**Activity** | **Participant** | **Delivers**
--- | --- | --- |
Detailed Technical Design/Code | Developers | Automated Unit Tests
Test Design - Based on Acceptance Criteria and others | Testers, Business Analysts | Key scope to be automated
Exploratory Testing | Testers | Test Ideas for automation
Test Design System and Non-functional requirements | Testers, Development Team, Business analysts | Key scope to be automated
Variant Testing Needs | Testers | Additional scope to be automated
Smoke Test Definition | Testers, Developers, DevOps | Key activity to be automated
Regression Test definition | Testers | Minimum need for the automated regression test

The goal is to have value added automation, not to automate for the sake of automation. We need to balance run time, complexity and value delivered.

### Approach for Functional Test Automation

**Phase** | **Activity** | **Description**
--- | --- | ---
| **Plan** | | 
| | Review Application road map | Understand what is included in the sprint's scope and what items we definitely have to address.
| | Review manual test cases (see above for other sources as well) | The testers start to create manual test cases and these will provide the test ideas for the test automation. 
| | Verify Testability | Not all manual tests can be automated, tests that depend on human visual processing for instance are impossible to automate. An example of a category of tests that cannot be automated is usability testing.
| | Selection of Automation Candidates | Once the inventory of potential candidates has been reviewed, we are able to select the test automation candidates. 
| | Define Test Strategy/Plan | Then we create the automation plan, this set up the general guidelines, the structure and the planned time needed. 
**Design** | |
| | Re-factor manual tests to be ready for automation | Manual tests are often not yet fit for test automation and need to be reworked to achieve the same objective but now in an automated form. It is a common pitfall in test automation to try to exactly replicate the manual tests.
| | Framework design/approach | A test automation framework is an integrated system that sets the rules of automation of a specific product. This system integrates the function libraries, test data sources, object details and various reusable modules. These components act as small building blocks which need to be assembled to represent a business process. The framework provides the basis of test automation and simplifies the automation effort. 
| | Plan reusable libraries and actions | Identification of re-usable components and actions greatly improves the efficiency of the test automation effort. We strive towards a situation where most of our tests can be defined by variable data and the test automation framework will be able to execute.
| | Define other abstraction layers | Specialized automated functions like direct database queries, connection to external systems etc. can be abstracted for easier use in the test automation scripts.
| | Data Management Plan | We define how we handle the data needed for our test automation runs. To be able to repeatedly run our test automation suites, we handle our test data in a very organized way. This includes upload of test data, delete of data, restore/refresh activities, date forwarding/retarding etc.
**Develop** | |
| | Create Test scripts | Our scripts are created in <our tool>, we use <our language> as the programming language as it offers better features with regards to web testing. 
| | Data Management | Test data management is to be automated as well and we develop the scripts and batch jobs to do so. |
| | Build execution flow | For test automation execution run smoothly, we create an execution order/flow that consists of start up, data initiation, application initiation, test case execution, application shutdown, data shutdown and execution shutdown activities. If set up right, such a flow allows for easy improvements and extensions.
| | Recovery Scenarios | Test automation runs fail, this is a fact of life. In order to prepare for such an event we need to be clear on what we need to do and how to recover. This could involve a data restore or deletion.
| | Add to function libraries | Identified general functions are built and added to the functional libraries. 
| | Tool Extensions | <our tool> offers some extensions that are configured in order to have <our tool> connect with <defect management tool>. This way the tool can send information on failed test cases directly into <defect management tool>. We configure the tool to connect with <test management tool> and report test results into <test management tool.
| | Repository Management | We could use the repository management functions in <our tool> and integrate this with GitHub.
| | Documentation | We document the set up, the configuration, the extension configuration and general system requirements. The intent is to document to such a degree that this set up can be replicated in the future.
**Execute** | |
| | Create new Test environment | For every test run we need to either create or refresh our test environment to be guaranteed of a fresh start.
| | Deploy Test Suite | Identify the test suite we need to run in <our test tool>. This can either be done through the tool or by scripted invocation. The latter would happen in case of fully automated build and test. 
| | Execute Test Scripts | Test scripts are executed by the test automation tool engine and the scripts point to one of our test environments.
| | Results reporting | The tool collects all the results and communicate these to <our test management tool>.
| | Defect Management | Once the results are communicated, we review the failures and decide if this is an actual defect or not (a surprising amount of false positives come out of test automation tests runs). If this is a valid defect we use the integration with <our defect management tool> to record the details as obtained by the tool and add our own observation to it. This defect will then start the defect workflow just like any other defect.
| **Maintain** | |
| | Update Assets | Test automation keeps on working well if the assets (scripts, functions, actions) are kept up-to-date, clean and efficient. 
| | Archive Test Suite | Test Suites are valuable assets and are kept carefully as part of good practice but also for restore/recovery purposes. 
| | Maintain Test Suite(s) | Test suite maintenance involves adding new scripts, re-ordering scripts and pruning scripts that are no longer needed.
| | Regression Test Suite | Maintenance on the regression test suite is ongoing and the suite would typically grow over time. Please refer to the regression test strategy for a discussion on the activities that involved in the creation and maintenance of regression test suites.

Test automation will be able to create several Automated test Suites, they are:

- Regression Test Suite
- Smoke Test Suite
- Functional Test Suite, containing additional tests, in-depth tests and multiple variations tests

## Test Design

Test automation will leverage existing test design from the testers and others as mentioned above.

However, there are additions to the test design that automation can and will make. These additions are:

- **Repetition** : Automated tests can repeat certain actions for a long time. This could potentially trigger errors that are hard or even impossible to find when doing manual tests.
- **Variations**: Once an automated test has been defined it can be fed with data variations offering the unique possibility to completely explore all possibilities. This is something that a manual tester would simply not have the time for.
- **Stress** : Automated tests can put quite a bit of stress on a system, particularly if several suites are run in parallel.
- **Low value tests** : Once an automated test is defined it can be run over and over for almost no effort and cost. That means that even low value tests (tests that a manual tester would skip) could be included in the test suite.
- **Extended Checking** : An automated test can include system calls to different platforms (database, external systems) to check if the result observed is correct. A manual tester would spend significantly more time doing the same.

## Test Execution

Test automation execution can and will also be manually triggered by:

- Test Automation Specialist to:
  - Test the Test Suite (during development of the test suites)
  - Run specialized automated tests that are not part of the Smoke test or regression test suite
  - Run any test suite when the need is there
- Agile Tester to:
  - Test a specific Test Script (during development of the test script)
  - Run specialized automated tests that are not part of the Smoke test or regression test suite
  - Run any test suite or subset when the need is there

## Data Requirements

Test Automation needs data that:

- Is uniquely designed/selected for the type of test automation. This means that we need sets for: Unit Testing, Regression Testing, Smoke Testing and any other test suites.
- Is restorable so that the test automation can run with the same data in the same state over and over.
- Many business functions are date dependent, to obtain repeatability of test execution we need to create our data from scratch to that we can control the order of activities.
- Will _only_ be used for its intended purpose. This means that we need separate data sets for development of test automation and test execution.

## Infrastructure Requirements

The following infrastructure needs to be present:

- 1 QA Workstation Configured
- CI/CD Pipeline to integrate the tests in
- Test Environment(s)