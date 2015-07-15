require 'test_helper'

class RegistrantsControllerTest < ActionController::TestCase
  setup do
    @registrant = registrants(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:registrants)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create registrant" do
    assert_difference('Registrant.count') do
      post :create, registrant: { businesscity: @registrant.businesscity, businessname: @registrant.businessname, businessnumber: @registrant.businessnumber, businessstate: @registrant.businessstate, businessstreet: @registrant.businessstreet, businesszip: @registrant.businesszip, cellphone: @registrant.cellphone, firstname: @registrant.firstname, homecity: @registrant.homecity, homenumber: @registrant.homenumber, homephone: @registrant.homephone, homestate: @registrant.homestate, homestreet: @registrant.homestreet, homezip: @registrant.homezip, lastname: @registrant.lastname, middleinitial: @registrant.middleinitial }
    end

    assert_redirected_to registrant_path(assigns(:registrant))
  end

  test "should show registrant" do
    get :show, id: @registrant
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @registrant
    assert_response :success
  end

  test "should update registrant" do
    patch :update, id: @registrant, registrant: { businesscity: @registrant.businesscity, businessname: @registrant.businessname, businessnumber: @registrant.businessnumber, businessstate: @registrant.businessstate, businessstreet: @registrant.businessstreet, businesszip: @registrant.businesszip, cellphone: @registrant.cellphone, firstname: @registrant.firstname, homecity: @registrant.homecity, homenumber: @registrant.homenumber, homephone: @registrant.homephone, homestate: @registrant.homestate, homestreet: @registrant.homestreet, homezip: @registrant.homezip, lastname: @registrant.lastname, middleinitial: @registrant.middleinitial }
    assert_redirected_to registrant_path(assigns(:registrant))
  end

  test "should destroy registrant" do
    assert_difference('Registrant.count', -1) do
      delete :destroy, id: @registrant
    end

    assert_redirected_to registrants_path
  end
end
