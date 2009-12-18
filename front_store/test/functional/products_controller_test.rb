require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  
  test 'create' do
    Product.any_instance.expects(:save).returns(true)
    @product = products(:basic)
    post :create, :product => @product.attributes
    assert_response :redirect
  end
  
  test 'create with failure' do
    Product.any_instance.expects(:save).returns(false)
    @product = products(:basic)
    post :create, :product => @product.attributes
    assert_template 'new'
  end
  
  test 'update' do
    Product.any_instance.expects(:save).returns(true)
    @product = products(:basic)
    put :update, :id => products(:basic).to_param, :product => @product.attributes
    assert_response :redirect
  end
  
  test 'update with failure' do
    Product.any_instance.expects(:save).returns(false)
    @product = products(:basic)
    put :update, :id => products(:basic).to_param, :product => @product.attributes
    assert_template 'edit'
  end
  
  test 'destroy' do
    Product.any_instance.expects(:destroy).returns(true)
    @product = products(:basic)
    delete :destroy, :id => @product.to_param
    assert_not_nil flash[:notice] 
    assert_response :redirect
  end
  
  # Not possible: destroy with failure
  
  test 'new' do
    get :new
    assert_response :success
  end
  
  test 'edit' do
    @product = products(:basic)
    get :edit, :id => @product.to_param
    assert_response :success
  end
  
  test 'show' do
    @product = products(:basic)
    get :show, :id => @product.to_param
    assert_response :success
  end
  
  test 'index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end
  
end