require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "product new" do
    @product_form = {name: "TestingOne", depscription: '......' }
    @product = Product.new @product_form

    assert @product.save
    p @product
    assert @product.destroy

    p 'product new [passed]'
  end
end
