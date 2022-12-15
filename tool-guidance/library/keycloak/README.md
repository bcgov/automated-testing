# Using Keycloak in Cypress
To use Keycloak in Cypress, we'll use: https://www.npmjs.com/package/cypress-keycloak, this package is installed with the --force option to avoid issues when you install a newer Cypress version. This is recommended by the author as he sometime lags adding the new version to the list of compatible versions.

The example here solely focuses on logging in on the BCGOV keycloak instances for authentication.
This method is used to avoid create UI test scripts that log in through the web interface. Such a method is one of Cypress' documented anti-patterns. See [here](https://docs.cypress.io/guides/references/best-practices#Organizing-Tests-Logging-In-Controlling-State).


