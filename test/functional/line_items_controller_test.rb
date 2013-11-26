require 'test_helper'

class LineItemsControllerTest < ActionController::TestCase
  setup do
    @line_item = line_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:line_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create line_item" do
    assert_difference('LineItem.count') do
      post :create, product_id: products(:ruby).id 
    end

    assert_redirected_to store_path
  end
# test duplicate products added to cart
test "should has same item entries count when add duplicate product" do
# add one Ruby book
      post :create, product_id: products(:ruby).id 
assert_difference('LineItem.count', 0) do
      post :create, product_id: products(:ruby).id 
end

end
# END of test duplicate products added to cart
# test unique product added to cart 
test "should increment count when add duplicate product" do
# add one Ruby book
      post :create, product_id: products(:one).id 
assert_difference('LineItem.count', 1) do
      post :create, product_id: products(:ruby).id 
end

end
# END of test unique product added to cart 

  test "should show line_item" do
    get :show, id: @line_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @line_item
    assert_response :success
  end

  test "should update line_item" do
    put :update, id: @line_item, line_item: @line_item.attributes
    assert_redirected_to line_item_path(assigns(:line_item))
  end

  test "should destroy line_item" do
    assert_difference('LineItem.count', -1) do
      delete :destroy, id: @line_item
    end

    assert_redirected_to line_items_path
  end
end
