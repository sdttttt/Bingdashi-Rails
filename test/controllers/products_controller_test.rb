require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  test "access new product" do
    post products_path, params: {
      product:{
        name: "testOne",
        depscription: "......"
      }
    }

    assert_equal 'POST', @request.method

    p 'access new product [passed]'
  end
end
