module StepsHelper

  include DataMagic

  def get_expected_puppies(domain)
    DataMagic.load(domain)
    expected_puppy_list = []
    data = data_for(:puppies)
    data.each do |key, value|
      value_aux = value.split('|')
      expected_puppy_list.push({'Puppy name' => value_aux[0],
                                'Gender' => value_aux[1],
                                'Breed' => value_aux[2]})
    end
    expected_puppy_list
  end

end

World(StepsHelper)