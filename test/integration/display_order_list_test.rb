require 'test_helper'

class DisplayOrderListTest < Capybara::Rails::TestCase
  def setup
    @tshirt = Item.create!(title: 'T-Shirt', price: 19.99, currency: 'EUR')
    @shoes = Item.create!(title: 'Shoes', price: 59.99, currency: 'EUR')
  end

  test "displays selected items" do
    visit items_path

    @tshirt.select
    assert @tshirt.selected?

    visit orders_path

    assert page.has_content?('T-Shirt')
    assert page.has_content?('19,99 EUR')
  end

  test "display other selected items" do
    visit items_path

    @shoes.select
    assert @shoes.selected?

    visit orders_path

    assert page.has_content?('Shoes')
    assert page.has_content?('59,99 EUR')
    assert_not page.has_content?('T-Shirt')
  end

  test "remove items from selected items list" do
    visit items_path

    @tshirt.select
    assert @tshirt.selected?
    @tshirt.unselect
    assert_not @tshirt.selected?

    visit orders_path

    assert_not page.has_content?('T-Shirt')
  end

end
