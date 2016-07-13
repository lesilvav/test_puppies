class CheckoutPage
  include PageObject
  include DataMagic

  text_field(:name, :id => 'order_name')
  text_area(:address, :id => 'order_address')
  text_field(:email, :id => 'order_email')
  select_list(:pay_type, :id => 'order_pay_type')
  button(:place_order, :name => 'commit')

  def loaded?
    begin
      Watir::Wait.until(5) { name_element.exists? }
      true
    rescue error
      false
    end
  end

  def checkout(data = {})
    data = data_for(:checkout_page, data)

    #data = DEFAULT_DATA.merge(data)
    self.name = data['name']
    self.address = data['address']
    self.email = data['email']
    self.pay_type = data['pay_type']
    place_order
  end

end