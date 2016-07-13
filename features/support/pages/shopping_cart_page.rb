class ShoppingCartPage
  include PageObject

  element(:complete_adoption_button, :input, :xpath => "//input[@value='Complete the Adoption']")

  def loaded?
    begin
      Watir::Wait.until(5) { complete_adoption_button_element.exists? }
      true
    rescue error
      false
    end
  end

  def proceed_to_checkout
    complete_adoption_button_element.click
  end
end