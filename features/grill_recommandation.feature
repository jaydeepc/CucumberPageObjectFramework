
Feature: Saber Grill Finder Recommendation Verification
  @smoke
  Scenario: Verify that user gets a recommendation after completing Questionnaire
    Given I am in the Homepage
    When I navigate to Grill Recommendation Page
    And Complete the Questionnaire
    Then I should get a Recommendation

