class PuppyListItemSection
  include PageObject
  XPATH ||= "//div[@class='puppy_list']/div[contains(@class,'list_line')]"

  h3(:name, :xpath => ".//div[@class='name']/h3")
  h4(:breed, :xpath => ".//div[@class='details']/h4[1]")
  h4(:gender, :xpath => ".//div[@class='details']/h4[2]")
  button(:view_details_button, :xpath => ".//input[@value='View Details']")

  def name
    name_element.text
  end

  def breed
    breed_element.text
  end

  def gender
    gender_element.text
  end

  def view_details
    view_details_button
  end
end