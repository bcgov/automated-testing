// API Call example
import "cypress-plugin-api";

describe("API Example", () => {
  beforeEach(() => {});
  afterEach(() => {});

  it("Gets Health Status", () => {
    cy.api({
      method: "GET",
      url: "https://artifacts.developer.gov.bc.ca/router/api/v1/system/health",
    }).then(({ body }) => {
      cy.log(JSON.stringify(body));
      expect(body.router.state).to.equal("HEALTHY");
      expect(body.router.message).to.equal("OK");
      for (var index in body.services) {
        expect(body.services[index].state).to.equal("HEALTHY");
        expect(body.services[index].message).to.equal("OK");
      }
    });
  });
});
