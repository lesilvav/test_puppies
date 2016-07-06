When(/^I navigate through the list of puppies$/) do
  @available_puppies = on(HomePage).get_list_of_available_puppies
end

Then(/^the list of available puppies should be the following:$/) do |expected_puppy_list|
  # table is a table.hashes.keys # => [:Puppy name, :Breed, :Gender]
  @available_puppies.should have_same_items expected_puppy_list
end