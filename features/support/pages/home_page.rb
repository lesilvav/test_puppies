class HomePage
  include PageObject

  elements(:view_detail_buttons, :input, :class => 'rounded_button')
  link(:next_page_link, :text => 'Next →')
  span(:next_page_link_disabled, :class => 'next_page disabled')
  page_sections(:puppies, PuppyListItemSection, :xpath => PuppyListItemSection::XPATH)

  page_url "http://puppies.herokuapp.com"

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

  def is_next_link_enabled?
    if next_page_link_disabled?
      false
    else
      true
    end
  end

  def get_list_of_available_puppies
    list_of_available_puppies = []
    loop do
      puppies.each do |puppy|
        list_of_available_puppies.push({'Puppy name' => puppy.name,
                                        'Breed' => puppy.breed,
                                        'Gender' => puppy.gender})
      end
      is_next_link_enabled? ? next_page_link : break
    end
    list_of_available_puppies
  end


  def select_puppy(name)
    loop do
      puppies.each do |puppy|
        if puppy.name == name
          puppy.view_details
          return true
        end
      end
      is_next_link_enabled? ? next_page_link : fail("Puppy with name \"#{name}\" was not found in the DOM")
    end
  end


end
