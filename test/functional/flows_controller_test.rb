require 'test_helper'

class FlowsControllerTest < ActionController::TestCase

  setup do
    @flows_count = Fabricate(:flows_count)
    @flow = Fabricate(:flow)
    @user = Fabricate(:user)
  end

  test "should get index" do
    sign_in @user

    get :index
    assert_response :success
    assert_not_nil assigns(:flows)
    assert_select '#unexpected_error', false
    assert_template "flows/index"
  end

  test "should get new" do
    sign_in @user

    get :new
    assert_response :success
    assert_not_nil assigns(:flow)
    assert_select '#unexpected_error', false
    assert_template "flows/new"
  end

  test "should create flow" do
    sign_in @user

    assert_difference 'Flow.count' do
      assert_difference 'Version.count', 2 do
        post :create, flow: Fabricate.attributes_for(:flow)
      end
    end

    assert_redirected_to flow_url(assigns(:flow))
  end

  test "should show flow" do
    sign_in @user

    get :show, id: @flow
    assert_response :success
    assert_not_nil assigns(:flow)
    assert_select '#unexpected_error', false
    assert_template "flows/show"
  end

  test "should get edit" do
    sign_in @user

    get :edit, id: @flow
    assert_response :success
    assert_not_nil assigns(:flow)
    assert_select '#unexpected_error', false
    assert_template "flows/edit"
  end

  test "should update flow" do
    sign_in @user
    assert_difference 'Version.count', 2 do
      put :update, id: @flow, 
        flow: Fabricate.attributes_for(:flow, description: 'updated')
      assert_redirected_to flow_url(assigns(:flow))
    end
  end
end
