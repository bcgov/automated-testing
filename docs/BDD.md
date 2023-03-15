# BDD
BDD (Behavior Driven Development) is a process designed to aid the management and the delivery of software development projects by improving communication between engineers and business professionals. In so doing, BDD ensures all development projects remain focused on delivering what the business actually needs while meeting all requirements of the user.

## Key benefits of BDD
* All development work can be traced back directly to business objectives.
* Software development meets user need. Satisfied users = good business.
* Efficient prioritization – business-critical features are delivered first.
* All parties have a shared understanding of the project and can be involved in the communication.
* A shared language ensures everyone (technical or not) has thorough visibility into the project’s progression.
* Resulting software design that matches existing and supports upcoming business needs.
* Improved quality code reducing costs of maintenance and minimizing project risk.

BDD attempts to eliminate the cost of translation by reducing the size of feedback loops and enforcing the example-based conversation about each feature before they are built. The solution for this problem is the concept the BDD community borrowed from DDD (Domain Driven Design): ubiquitous language.

The most common and adopted format for examples is Given-When-Then which is the format you’ll see most used by the BDD community. It follows a very simple structural agreement.

**'Given'**, describes the initial context for the example

**'When'** describes the action that the actor in the system or stakeholder performs

**'Then'** describes the expected outcome of that action

This language is also referred to as Gherkin. [Gherkin](https://docs.behat.org/en/v2.5/guides/1.gherkin.html#:~:text=Gherkin%20is%20a%20Business%20Readable,project's%20documentation%20and%20automated%20tests.)is a [Business Readable, Domain Specific Language](http://martinfowler.com/bliki/BusinessReadableDSL.html) created especially for behavior descriptions. It gives you the ability to remove logic details from behavior tests.

## What is the relevance to Test Automation?
With BDD, you write human-readable stories that describe the behavior of your application. With the right test tools, there stories can be directly translated into tests which then give a one to one relationship between your story and the test result.

## How do I implement BDD in my team?
That's is a whole other challenge going beyond the scope of Test Automation, but it is safe to say that for an effective use of BDD in your team, you need alignment and discipline to reap the rewards.

## BDD and my tool
BDD is not supported in my tool, so I am stuck!
Not necessarily so as many tools allow for extensions to be added that will allow for Gherkin test specification.
