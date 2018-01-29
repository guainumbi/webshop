require 'test_helper'

class DisplayItemsTest < Capybara::Rails::TestCase
  def setup
    Item.create!(title: 'T-Shirt', price: 19.99, currency: 'EUR')
  end

  test 'items index shows title price and currency' do
    visit items_path

    assert page.has_content?('T-Shirt')
    assert page.has_content?('19,99')
    assert page.has_content?('EUR')
  end
end
