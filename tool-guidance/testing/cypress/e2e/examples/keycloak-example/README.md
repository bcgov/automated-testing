# Using Keycloak in Cypress
To use Keycloak in Cypress, we'll use: https://www.npmjs.com/package/cypress-keycloak, this package is installed with the --force option to avoid issues when you install a newer Cypress version. This is recommended by the author as he sometime lags adding the new version to the list of compatible versions.

The example here solely focuses on logging in (and out) on the BCGOV keycloak instances for authentication.
This method is used to avoid create UI test scripts that log in through the web interface. Such a method is one of Cypress' documented anti-patterns. See [here](https://docs.cypress.io/guides/references/best-practices#Organizing-Tests-Logging-In-Controlling-State).

The keycloak pack does allow for other functionality to be used, but that is not addressed here. See the [github repo](https://github.com/babangsund/cypress-keycloak) for more info.

## Environment variables
The example code uses the following environment variables:
* username - User ID
* password - Password
* authRealm - Keycloak realm
* authClientId - Keycloak Client ID
* authUrl - The keycloak instance URL

For local running we would implement a `cypress.env.json` file in the root of your testing directory.
```
{
    "username": "cypress@idir",
    "password": "<password>",
    "host": "https://dev-biohubbc.apps.silver.devops.gov.bc.ca",
    "authRealm": "35r1iman",
    "authClientId": "biohubbc",
    "authUrl": "https://dev.oidc.gov.bc.ca"
  }
 ```
