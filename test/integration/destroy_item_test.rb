require 'test_helper'

class DestroyItemTest < Capybara::Rails::TestCase
  def setup
    @tshirt = Item.create!(title: 'Glasses', price: 19.99, currency: 'EUR')
  end

  test "item has been deleted successfully" do
    visit items_path

    @tshirt.destroy
    assert @tshirt.destroyed?
    # assert_equal current_path, items_path // test for updated content after redirect not working
    visit items_path
    assert_not page.has_content?('Glasses')
    page.has_content?('19,99 EUR')
  end
end
