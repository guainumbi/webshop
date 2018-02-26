require 'test_helper'

class DisplayAddingItemsFormTest < Capybara::Rails::TestCase
  test "display title, price and currency input and submit button" do
    visit add_items_index_path

    assert page.has_css?('input[name="item[title]"]')
    assert page.has_css?('input[name="item[price]"]')
    assert page.has_css?('input[name="item[currency]"]')
    assert page.has_css?('input[type="submit"]')
  end

  test "form submit adds item, reloads add_items-page and displays item" do
    visit add_items_index_path

    fill_in 'item[title]', :with => 'Dress'
    fill_in 'item[price]', :with => '23'
    fill_in 'item[currency]', :with => 'EUR'
    find('input[type="submit"]').click

    assert_equal current_path, add_items_index_path

    assert page.has_content?('Dress')
    assert page.has_content?('23,00 EUR')
  end
end
