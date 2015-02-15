require 'test_helper'

class PeopleControllerTest < ActionController::TestCase

  test "should get index" do
    assert_difference -> { PeopleController.pre_render_invocation_count } do
      get :index
    end
    assert_response :success
    assert_not_nil assigns(:people)
  end

  # test "should get new" do
  #   get :new
  #   assert_response :success
  # end

  # test "should create person" do
  #   assert_difference('Person.count') do
  #     post :create, person: { age: @person.age, name: @person.name }
  #   end

  #   assert_redirected_to person_path(assigns(:person))
  # end

  # test "should show person" do
  #   get :show, id: @person
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get :edit, id: @person
  #   assert_response :success
  # end

  # test "should update person" do
  #   patch :update, id: @person, person: { age: @person.age, name: @person.name }
  #   assert_redirected_to person_path(assigns(:person))
  # end

  # test "should destroy person" do
  #   assert_difference('Person.count', -1) do
  #     delete :destroy, id: @person
  #   end

  #   assert_redirected_to people_path
  # end
end