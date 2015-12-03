require 'test_helper'

class InquirersControllerTest < ActionController::TestCase
  setup do
    @inquirer = inquirers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:inquirers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create inquirer" do
    assert_difference('Inquirer.count') do
      post :create, inquirer: { email: @inquirer.email, password: @inquirer.password, password_confirmation: @inquirer.password_confirmation, username: @inquirer.username }
    end

    assert_redirected_to inquirer_path(assigns(:inquirer))
  end

  test "should show inquirer" do
    get :show, id: @inquirer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @inquirer
    assert_response :success
  end

  test "should update inquirer" do
    patch :update, id: @inquirer, inquirer: { email: @inquirer.email, password: @inquirer.password, password_confirmation: @inquirer.password_confirmation, username: @inquirer.username }
    assert_redirected_to inquirer_path(assigns(:inquirer))
  end

  test "should destroy inquirer" do
    assert_difference('Inquirer.count', -1) do
      delete :destroy, id: @inquirer
    end

    assert_redirected_to inquirers_path
  end
end
