require 'test_helper'

class GaleriesControllerTest < ActionController::TestCase
  setup do
    @galery = galeries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:galeries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create galery" do
    assert_difference('Galerie.count') do
      post :create, :galery => @galery.attributes
    end

    assert_redirected_to galery_path(assigns(:galery))
  end

  test "should show galery" do
    get :show, :id => @galery.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @galery.to_param
    assert_response :success
  end

  test "should update galery" do
    put :update, :id => @galery.to_param, :galery => @galery.attributes
    assert_redirected_to galery_path(assigns(:galery))
  end

  test "should destroy galery" do
    assert_difference('Galerie.count', -1) do
      delete :destroy, :id => @galery.to_param
    end

    assert_redirected_to galeries_path
  end
end
