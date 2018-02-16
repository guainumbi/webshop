require 'test_helper'

class DisplayItemsTest < Capybara::Rails::TestCase

  test 'items index shows title price and currency' do
    Item.create!(title: 'T-Shirt', price: 19.99, currency: 'EUR')

    visit items_path

    assert page.has_content?('T-Shirt')
    assert page.has_content?('19,99 EUR')
  end

  test 'items index shows another title price and currency' do
    Item.create!(title: 'Shoes', price: 59.99, currency: 'EUR')

    visit items_path

    assert page.has_content?('Shoes')
    assert page.has_content?('59,99 EUR')
    assert_not page.has_content?('T-Shirt')
  end

  test 'display line items count and select (and remove links if item selected)' do
    Item.create!(title: 'T-Shirt', price: 19.99, currency: 'EUR')

    visit items_path
    within('span#quantity-display') do
      assert page.has_content?('0')
    end
    assert page.has_content?('select')
    click_on('select')
    click_on('select')
    within('span#quantity-display') do
      assert page.has_content?('2')
    end
    assert page.has_content?('remove')
    click_on('remove')
    within('span#quantity-display') do
      assert page.has_content?('0')
    end
    assert_not page.has_content?('remove')
  end
end
