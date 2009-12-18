require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  
  test 'create' do
    Order.any_instance.expects(:save).returns(true)
    @order = orders(:basic)
    post :create, :order => @order.attributes
    assert_response :redirect
  end
  
  test 'create with failure' do
    Order.any_instance.expects(:save).returns(false)
    @order = orders(:basic)
    post :create, :order => @order.attributes
    assert_template 'new'
  end
  
  test 'update' do
    Order.any_instance.expects(:save).returns(true)
    @order = orders(:basic)
    put :update, :id => orders(:basic).to_param, :order => @order.attributes
    assert_response :redirect
  end
  
  test 'update with failure' do
    Order.any_instance.expects(:save).returns(false)
    @order = orders(:basic)
    put :update, :id => orders(:basic).to_param, :order => @order.attributes
    assert_template 'edit'
  end
  
  test 'destroy' do
    Order.any_instance.expects(:destroy).returns(true)
    @order = orders(:basic)
    delete :destroy, :id => @order.to_param
    assert_not_nil flash[:notice] 
    assert_response :redirect
  end
  
  # Not possible: destroy with failure
  
  test 'new' do
    get :new
    assert_response :success
  end
  
  test 'edit' do
    @order = orders(:basic)
    get :edit, :id => @order.to_param
    assert_response :success
  end
  
  test 'show' do
    @order = orders(:basic)
    get :show, :id => @order.to_param
    assert_response :success
  end
  
  test 'index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:orders)
  end
  
end