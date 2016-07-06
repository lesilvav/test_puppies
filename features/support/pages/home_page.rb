class HomePage
  include PageObject

  elements(:view_detail_buttons, :input, :class => 'rounded_button')
  page_sections(:puppies, PuppyListItemSection, :xpath => PuppyListItemSection::XPATH)
  page_url "http://puppies.herokuapp.com"
  link(:next_page_link, :text => 'Next →')


  def view_details(puppy_name = nil)
    case puppy_name
      when nil
        #primero de la lista
        view_detail_buttons.first.click
      else
        #escoger el valor de puppy_name
        xpath_value = "//div[@class='puppy_list']//div[@class='name']/h3[text()='#{puppy_name}']/parent::div/following-sibling::div[@class='view']//input"
        @browser.button(:xpath => xpath_value).click
    end
  end


  def get_list_of_available_puppies
    list_of_available_puppies = []
    number_of_pages = get_number_of_pages
    (number_of_pages.times-1).times do
      puppies.each do |puppy|
        list_of_available_puppies.push({'Puppy name' => puppy.name,
                                        'Breed' => puppy.breed,
                                        'Gender' => puppy.gender})
      end
      next_page_link
    end
  end
end