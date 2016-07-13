class PuppyDetailsPage
  include PageObject

  button(:adopt_me, :class => 'rounded_button')

  def loaded?(puppy_name)
    begin
      Watir::Wait.until(5) { @browser.text.include?(puppy_name) }
      true
    rescue error
      false
    end

  end

  def add_to_cart
    adopt_me
  end

end