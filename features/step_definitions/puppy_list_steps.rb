When(/^I navigate through the list of puppies$/) do
  @available_puppies = on(HomePage).get_list_of_available_puppies
end

Then(/^the list of available puppies should be the following:$/) do |expected_puppy_list|
  @available_puppies.should have_the_same_puppies_as expected_puppy_list.hashes
end