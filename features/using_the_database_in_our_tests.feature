Feature: Using the database in our tests

  Scenario: Create a puppy
    Given I have the a new puppy: "Bobby", "Siberian", "Male"

  #CR UD

  Scenario: Creating a new order in the database
    Given I know how many orders I have
    When I create a new order
    Then I should have 1 additional order

  Scenario: Read an order from the database
    Given I have an order for "George"
    When I read that order
    Then the order should have the name "George"


  Scenario: Updating an order object
    Given I have an order for "Goofie"
    When I update the name to "Minie"
    Then I should have a record for "Minie"
    And I should not have a record for "Goofie"

  Scenario: Delete an order object
    Given I have an order for "Daisey Duck"
    When I delete that order
    Then I should not have a record for "Daisey Duck"

  Scenario: A thank you message should be displayed when I adopt a puppy
    When I complete the adoption of puppy "Twinkie"
    Then I should see "Thank you for adopting a puppy"

  Scenario: Validate list of available puppies
    When I navigate through the list of puppies
    Then the list of available puppies should be listed
