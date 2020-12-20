require 'test_helper'

module CmsEngine
  class ResourcesControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @resource = cms_engine_resources(:one)
    end

    test "should get index" do
      get resources_url
      assert_response :success
    end

    test "should get new" do
      get new_resource_url
      assert_response :success
    end

    test "should create resource" do
      assert_difference('Resource.count') do
        post resources_url, params: { resource: { elements: @resource.elements, language: @resource.language, name: @resource.name, path: @resource.path, published: @resource.published, template_id: @resource.template_id } }
      end

      assert_redirected_to resource_url(Resource.last)
    end

    test "should show resource" do
      get resource_url(@resource)
      assert_response :success
    end

    test "should get edit" do
      get edit_resource_url(@resource)
      assert_response :success
    end

    test "should update resource" do
      patch resource_url(@resource), params: { resource: { elements: @resource.elements, language: @resource.language, name: @resource.name, path: @resource.path, published: @resource.published, template_id: @resource.template_id } }
      assert_redirected_to resource_url(@resource)
    end

    test "should destroy resource" do
      assert_difference('Resource.count', -1) do
        delete resource_url(@resource)
      end

      assert_redirected_to resources_url
    end
  end
end
