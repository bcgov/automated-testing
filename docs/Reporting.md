# Reporting

Running tools without being able to review the result is a waste of time. Therefore we need reporting that will quickly show us the status of our test runs (local and during CI).

For advanced reporting options with Cypress, please check [here](https://docs.cypress.io/guides/tooling/reporters). We will focus on the out-of-box capabilities.

Cypress offers the following possibilities:
1. Console reporting during the test run (local/CI)
2. Reporting in GitHub after a run in GitHub Actions
3. Reporting in interactive test creation tool, when running an individual test locally.
4. Reporting through the company's free (for Open Source projects) online reporting tool
5. The company's dashboarding and reporting tool does allow integration with Jira, Slack, GitHub and others (for a price)
6. Integrate Test results into [Allure](https://github.com/allure-framework) and [TestLink](https://github.com/TestLinkOpenSourceTRMS/testlink-code) (Open Source Test reporting and Test Management tools)

## Console Reporting
Run locally and Cypress will report back to the console, this will give you not only an overview but also details of what went wrong.

```
 (Run Finished)


       Spec                                              Tests  Passing  Failing  Pending  Skipped  
  ┌────────────────────────────────────────────────────────────────────────────────────────────────┐
  │ ✔  1-getting-started/todo.cy.ts             00:04        6        6        -        -        - │
  ├────────────────────────────────────────────────────────────────────────────────────────────────┤
  │ ✔  2-advanced-examples/actions.cy.ts        00:16       14       14        -        -        - │
  ├────────────────────────────────────────────────────────────────────────────────────────────────┤
  │ ✔  2-advanced-examples/aliasing.cy.ts       00:03        2        2        -        -        - │
  ├────────────────────────────────────────────────────────────────────────────────────────────────┤
  │ ✔  2-advanced-examples/assertions.cy.t      00:04        9        9        -        -        - │
  │    s                                                                                           │
  ├────────────────────────────────────────────────────────────────────────────────────────────────┤
  │ ✔  2-advanced-examples/connectors.cy.t      00:02        8        8        -        -        - │
  │    s                                                                                           │
  ├────────────────────────────────────────────────────────────────────────────────────────────────┤
  │ ✔  2-advanced-examples/cookies.cy.ts        00:02        5        5        -        -        - │
  ├────────────────────────────────────────────────────────────────────────────────────────────────┤
  │ ✖  2-advanced-examples/cypress_api.cy.      00:03       10        9        1        -        - │
  │    ts                                                                                          │
  ├────────────────────────────────────────────────────────────────────────────────────────────────┤
  │ ✔  2-advanced-examples/files.cy.ts          00:02        4        4        -        -        - │
  ├────────────────────────────────────────────────────────────────────────────────────────────────┤
  │ ✔  2-advanced-examples/location.cy.ts       00:02        3        3        -        -        - │
  ├────────────────────────────────────────────────────────────────────────────────────────────────┤
  │ ✔  2-advanced-examples/misc.cy.ts           00:04        6        6        -        -        - │
  ├────────────────────────────────────────────────────────────────────────────────────────────────┤
  │ ✔  2-advanced-examples/navigation.cy.t      00:03        3        3        -        -        - │
  │    s                                                                                           │
  ├────────────────────────────────────────────────────────────────────────────────────────────────┤
  │ ✔  2-advanced-examples/network_request      00:06        6        6        -        -        - │
  │    s.cy.ts                                                                                     │
  ├────────────────────────────────────────────────────────────────────────────────────────────────┤
  │ ✔  2-advanced-examples/querying.cy.ts       00:03        5        5        -        -        - │
  ├────────────────────────────────────────────────────────────────────────────────────────────────┤
  │ ✔  2-advanced-examples/spies_stubs_clo      00:05        7        7        -        -        - │
  │    cks.cy.ts                                                                                   │
  ├────────────────────────────────────────────────────────────────────────────────────────────────┤
  │ ✔  2-advanced-examples/storage.cy.ts        00:03        5        5        -        -        - │
  ├────────────────────────────────────────────────────────────────────────────────────────────────┤
  │ ✔  2-advanced-examples/traversal.cy.ts      00:04       18       18        -        -        - │
  ├────────────────────────────────────────────────────────────────────────────────────────────────┤
  │ ✔  2-advanced-examples/utilities.cy.ts      00:03        5        5        -        -        - │
  ├────────────────────────────────────────────────────────────────────────────────────────────────┤
  │ ✔  2-advanced-examples/viewport.cy.ts       00:04        1        1        -        -        - │
  ├────────────────────────────────────────────────────────────────────────────────────────────────┤
  │ ✔  2-advanced-examples/waiting.cy.ts        00:06        2        2        -        -        - │
  ├────────────────────────────────────────────────────────────────────────────────────────────────┤
  │ ✔  2-advanced-examples/window.cy.ts         00:02        3        3        -        -        - │
  ├────────────────────────────────────────────────────────────────────────────────────────────────┤
  │ ✔  examples/api-example/api-example.cy      317ms        1        1        -        -        - │
  │    .ts                                                                                         │
  ├────────────────────────────────────────────────────────────────────────────────────────────────┤
  │ ✔  examples/faker-example/faker-exampl      00:11        1        1        -        -        - │
  │    e.cy.ts                                                                                     │
  ├────────────────────────────────────────────────────────────────────────────────────────────────┤
  │ ✔  examples/keycloak-example/keycloak-      00:14        1        1        -        -        - │
  │    example.cy.ts                                                                               │
  └────────────────────────────────────────────────────────────────────────────────────────────────┘
    ✖  1 of 23 failed (4%)                      01:55      125      124        1        -        -  
```
## Reporting in GitHub after a run in GitHub Actions
If you run your Cypress Scripts in GitHub Actions, the results will be integrated in Github actions results.
![GitHub View of Test Result](https://github.com/bcgov/automated-testing/raw/main/media/cypress-run-GA-2.png)

When clicking on details, you can review the console output and review the feedback from the tool.
![GitHub Console View](https://github.com/bcgov/automated-testing/raw/main/media/gaconsole.png)

The run result from GHA, will also be enhanced with the Cypress results:
![GitHub Actions Result View](https://github.com/bcgov/automated-testing/blob/main/media/gha-result.png)

## Reporting in interactive test creation tool
While running the test in the interactive tool, you'll get a command by command report.
![Tool view](https://github.com/bcgov/automated-testing/raw/main/media/toolconsole.png)

## Reporting through the company's online reporting tool (Dashboard)
When you [create an account with Cypress](Create_Cypress_Account), you can try out their online reporting facility. To use this effectively, you have to create a project and obtain the project id and Record Keys. Once these are supplied during test execution, the reports from your run will be uploaded to the cloud.

Run Locally:

`npx cypress run --record --key <key value>`

Run in Github Actions:
```yaml
# Manual started workflow
name: e2e-complex
on: workflow_dispatch
jobs:
  cypress-run:
    runs-on: ubuntu-latest
    env:
      CYPRESS_RECORD_KEY: ${{ secrets.RECORDING_KEY }}
      CYPRESS_username: ${{ secrets.CYPRESS_USER_NAME }}
      CYPRESS_password: ${{ secrets.CYPRESS_PASSWORD }}
      CYPRESS_BASE_URL: ${{ secrets.CYPRESS_BASEURL }}
      CYPRESS_host: ${{ secrets.CYPRESS_HOST }}
      CYPRESS_ENVIRONMENT: ${{ github.base_ref }}
      CYPRESS_authRealm: ${{ secrets.CYPRESS_AUTH_REALM }}
      CYPRESS_authClientId: ${{ secrets.CYPRESS_AUTH_CLIENT_ID }}
      CYPRESS_authUrl: ${{ secrets.CYPRESS_AUTH_URL }}
    steps:
      # Checkout the PR branch
      - name: Checkout Target Branch
        uses: actions/checkout@v3

      - name: Cache node modules
        id: cache-npm
        uses: actions/cache@v3
        env:
          cache-name: cache-node-modules
        with:
          # npm cache files are stored in `~/.npm` on Linux/macOS
          path: ~/.npm
          key: ${{ runner.os }}-build-${{ env.cache-name }}-${{ hashFiles('**/package-lock.json') }}
          restore-keys: |
            ${{ runner.os }}-build-${{ env.cache-name }}-
            ${{ runner.os }}-build-
            ${{ runner.os }}-

      - if: ${{ steps.cache-npm.outputs.cache-hit != 'true' }}
        name: List the state of node modules
        continue-on-error: true
        run: npm list          

      - name: Wait for API response
        env:
          url: ${{ secrets.CYPRESS_API_HOST }}
          code: 200
          wait_time: 10
          max_attempts: 5
        run: |
          cd tool-guidance/testing
          chmod +x waitforconnection.sh
          bash ./waitforconnection.sh          

      - name: Wait for APP response
        env:
          url: ${{ secrets.CYPRESS_HOST }}
          code: 200
          wait_time: 10
          max_attempts: 5
        run: |
          cd tool-guidance/testing
          chmod +x waitforconnection.sh
          bash ./waitforconnection.sh   

      # Install Node - for `node` and `npm` commands
      - name: Setup Node.js
        uses: actions/setup-node@v2
        with:
          node-version: 16

      - name: E2E Smoke tests
        uses: cypress-io/github-action@v5
        # let's give this action an ID so we can refer
        # to its output values later
        id: smoke
        continue-on-error: false
        with:
          wait-on: ${{ secrets.CYPRESS_HOST }}
          wait-on-timeout: 120
          record: true
          install-command: npm ci -f
          working-directory: tool-guidance/testing
          browser: chrome
          ci-build-id: ${{ github.event.number }}

      - name: Print Env Vars
        run: |
          echo Git Base Ref: ${{ github.base_ref }}
          echo Git Change ID: ${{ github.event.number }}
          echo Cypress BaseUrl: $CYPRESS_BASE_URL
          echo Cypress Host: $CYPRESS_HOST
          echo Cypress Host: $CYPRESS_ENVIRONMENT
          echo Keycloak Authorization Realm: $CYPRESS_authRealm
          echo Keycloak Authorization Client ID: $CYPRESS_authClientId
          echo Keycloak Authorization URL: $CYPRESS_authUrl
```




Dashboard output:

![Dashboard](https://github.com/bcgov/automated-testing/blob/main/media/cypressdash.png)