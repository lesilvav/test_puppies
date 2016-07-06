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
    Then the list of available puppies should be the following:
      | Puppy name | Breed                                | Gender |
      | Brook      | Golden Retriever                     | Female |
      | Hanna      | Labrador Retriever Mix               | Female |
      | Maggie     | Mae Border Colie Mix                 | Female |
      | Ruby       | Sue Pit Bull Terrier                 | Female |
      | Sparky     | Austrailian Cattle Dog (Blue Heeler) | Male   |
      | Spud       | Beagle/Hound Mix                     | Male   |
      | Tipsy      | Terrier Mix                          | Female |
      | Topsy      | Terrier Mix                          | Female |
      | Twinkie    | Boxer/Rat Terrier Mix                | Female |