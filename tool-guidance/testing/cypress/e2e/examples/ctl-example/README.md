# Cypress Testing Library

Cypress Testing Library allows the use of dom-testing queries within Cypress end-to-end browser tests.

This allows you to use [`DOM Testing Library`](https://github.com/testing-library/dom-testing-library) methods in your [Cypress](http://cypress.io) tests.


## Installation

This module will be installed by our `install.sh` script when desired.
Both the javascript and TypeScript versions are supported.

## Usage

`Cypress Testing Library` extends Cypress' `cy` command.

Add this line to your project's `cypress/support/commands.js`:

```javascript
import "@testing-library/cypress/add-commands";
```

You can now use all of `DOM Testing Library`'s `findBy` and `findAllBy`
commands.
[See the `DOM Testing Library` docs for reference](https://testing-library.com)

You can find
[all Library definitions here](https://github.com/testing-library/cypress-testing-library/tree/main/types/index.d.ts).

To configure DOM Testing Library, use the following custom command:

```javascript
cy.configureCypressTestingLibrary(config);
```

To show some simple examples (from
[cypress/e2e/ctl-example.cy.ts](cypress/e2e/ctl-example.cy.ts)):

```javascript
cy.findAllByText("Button Text").should("exist");
cy.findAllByText("Non-existing Button Text").should("not.exist");
cy.findAllByLabelText("Label text", { timeout: 7000 }).should("exist");
cy.findAllByText("Jackie Chan").click();

// findAllByText _inside_ a form element
cy.get("form").findAllByText("Button Text").should("exist");
```

### Differences from DOM Testing Library

`Cypress Testing Library` supports both jQuery elements and DOM nodes. This is
necessary because Cypress uses jQuery elements, while `DOM Testing Library`
expects DOM nodes. When you chain a query, it will get the first DOM node from
`subject` of the collection and use that as the `container` parameter for the
`DOM Testing Library` functions.

`query*` queries are not supported. You should use the `should('not.exist')`
assertion instead to check for the absence of an element.

`get*` queries are not supported. `find*` queries do not use the Promise API of
`DOM Testing Library`, but instead forward to the `get*` queries and use
Cypress' built-in retryability using error messages from `get*` APIs to forward
as error messages if a query fails.

`findAll*` can select more than one element and is closer in functionality to
how Cypress built-in commands work. `find*` commands will fail if more than one
element is found that matches the criteria which is not how built-in Cypress
commands work, but is provided for closer compatibility to other Testing
Libraries.

Cypress handles actions when there is only one element found. For example, the
following will work without having to limit to only 1 returned element. The
`cy.click` will automatically fail if more than 1 element is returned by the
`findAllByText`:

```javascript
cy.findAllByText("Some Text").click();
```

If you intend to enforce only 1 element is returned by a selector, the following
examples will both fail if more than one element is found.

```javascript
cy.findAllByText("Some Text").should("have.length", 1);
cy.findByText("Some Text").should("exist");
```

## Config testIdAttribute

If you would like to change the default testId from `data-testId` to
`data-test-id`, add to your project's `cypress/support/index.js`:

```javascript
import { configure } from "@testing-library/cypress";
configure({ testIdAttribute: "data-test-id" });
```

It accepts all configurations listed in
[DOM testing library](https://testing-library.com/docs/dom-testing-library/api-configuration).
