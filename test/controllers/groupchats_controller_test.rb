require 'test_helper'

class GroupchatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @groupchat = groupchats(:one)
  end

  test "should get index" do
    get groupchats_url
    assert_response :success
  end

  test "should get new" do
    get new_groupchat_url
    assert_response :success
  end

  test "should create groupchat" do
    assert_difference('Groupchat.count') do
      post groupchats_url, params: { groupchat: { group_id: @groupchat.group_id } }
    end

    assert_redirected_to groupchat_url(Groupchat.last)
  end

  test "should show groupchat" do
    get groupchat_url(@groupchat)
    assert_response :success
  end

  test "should get edit" do
    get edit_groupchat_url(@groupchat)
    assert_response :success
  end

  test "should update groupchat" do
    patch groupchat_url(@groupchat), params: { groupchat: { group_id: @groupchat.group_id } }
    assert_redirected_to groupchat_url(@groupchat)
  end

  test "should destroy groupchat" do
    assert_difference('Groupchat.count', -1) do
      delete groupchat_url(@groupchat)
    end

    assert_redirected_to groupchats_url
  end
end
