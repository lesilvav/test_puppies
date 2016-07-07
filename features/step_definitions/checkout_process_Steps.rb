When(/^I navigate to the checkout page$/) do
  pending
end

Given(/^I am on the puppy adoption site$/) do
  visit(HomePage)
end

When(/^I attempt to checkout for puppy "([^"]*)", without (?:a|an) "([^"]*)"$/) do |puppy_name, field|
  on(HomePage).view_details(puppy_name)
  on(PuppyDetailsPage).loaded?(puppy_name).should be true
  on(PuppyDetailsPage).open_adoption_page
  on(PuppyItemsPage).loaded?
  on(PuppyItemsPage).complete_adoption
  on(CheckoutPage).loaded?
  case field
    when 'Name'
      on(CheckoutPage).checkout('name' => '')
    when 'Address'
      on(CheckoutPage).checkout('address' => '')
  end
end

Then(/^I should see the error message "([^"]*)"$/) do |error_message|
  @browser.text.include?(error_message).should be true
  sleep 8
end


Then(/^I should see the following payment options:$/) do |table|
  # table is a table.hashes.keys # => [:pay_type]
  pending
end

When(/^I complete the adoption of a puppy$/) do
  pending
end
