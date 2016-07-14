Feature: Completing the checkout process

  The final step of the checkout process is to
  collect some information about the adopter

  Background:
    Given I am on the puppy adoption site

  Scenario Outline: Fields validation on check out
    When I attempt to checkout for puppy "<puppy_name>", without a "<field>"
    Then I should see the error message "<field> can't be blank"
    Examples:
      | puppy_name | field   |
      | Brook      | Name    |
      | Hanna      | Address |


  Scenario: Validate list of available puppies
    When I navigate through the list of puppies
    Then the list of available puppies should be listed

  Scenario: Adopting a puppy
    When I click the View Details button for 'Brook'
    And I click the Adopt Me button
    And I click the Complete the Adoption button
    And I complete the adoption with:
      | name  | address        | email                   | pay_type |
      | Yosit | Yosit' address | ysanchez@belatrixsf.com | Check    |
    Then I should see "Thank you for adopting a puppy"

  Scenario: A thank you message should be displayed when I adopt a puppy
    When I complete the adoption of puppy "Twinkie"
    Then I should see "Thank you for adopting a puppy"
