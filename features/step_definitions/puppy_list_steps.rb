include DataMagic

When(/^I navigate through the list of puppies$/) do
  @available_puppies = on(HomePage).get_list_of_available_puppies
end

Then(/^the list of available puppies should be listed$/) do
  @available_puppies.should have_the_same_puppies_as get_expected_puppies('puppies.yml')
end