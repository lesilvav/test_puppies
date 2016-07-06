class HomePage
  include PageObject

  elements(:view_detail_buttons, :input, :class => 'rounded_button')
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

end
