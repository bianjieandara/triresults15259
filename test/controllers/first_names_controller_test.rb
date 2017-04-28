require 'test_helper'

class FirstNamesControllerTest < ActionController::TestCase
  setup do
    @first_name = first_names(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:first_names)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create first_name" do
    assert_difference('FirstName.count') do
      post :create, first_name: { birth_year: @first_name.birth_year, city: @first_name.city, gender: @first_name.gender, last_name: @first_name.last_name, state: @first_name.state }
    end

    assert_redirected_to first_name_path(assigns(:first_name))
  end

  test "should show first_name" do
    get :show, id: @first_name
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @first_name
    assert_response :success
  end

  test "should update first_name" do
    patch :update, id: @first_name, first_name: { birth_year: @first_name.birth_year, city: @first_name.city, gender: @first_name.gender, last_name: @first_name.last_name, state: @first_name.state }
    assert_redirected_to first_name_path(assigns(:first_name))
  end

  test "should destroy first_name" do
    assert_difference('FirstName.count', -1) do
      delete :destroy, id: @first_name
    end

    assert_redirected_to first_names_path
  end
end
