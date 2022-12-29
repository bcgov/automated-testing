## Workflows
In this library you'll find examples of GitHub Actions workflows that you can use to run your Cypress tests in GHA.
The examples are based on using the following GitHub Action: https://github.com/cypress-io/github-action
You'll find detailed documentation about the action there as well.

To effectively run your tests in GHA, you have to make sure that you have set up your test suite using environment variables, some of which can be hardcoded into the workflow and others can be pulled from Github secrets.

The following workflows examples are available:
* Cypress Simple Manual: The most basic set up, that can be started manually
* Cypress Complex Manual: The more complex set up, that can be started manually
* Cypress Complex Auto: The more complex set up, that will be started automatically when code is pushed

_NB: These workflows have a special install directive for Cypress to avoid version clashes between Cypress and used components. This will show up as WARN in your console output._
