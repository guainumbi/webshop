require 'test_helper'

class DisplayAddingItemsFormTest < Capybara::Rails::TestCase
  test "display title, price and currency input and submit button" do
    visit add_items_index_path

    assert page.has_css?('input[name="item[title]"]')
    assert page.has_css?('input[name="item[price]"]')
    assert page.has_css?('input[name="item[currency]"]')
    assert page.has_css?('input[type="submit"]')
  end
end
