require_relative '../../../../lib/cms_engine/api_request_authorizer'

module CmsEngine
  module Api
    class ResourcesController < ActionController::API
      before_action :authorize_request

      def index
        render json: resources
      end


      def show
        resource = resources.find_by(path: params[:resource_path])

        render json: resource
      end

      private

      def resources
        @resources ||= Resource.where(template: template, language: params[:language], published: true)
      end

      def template
        @template ||= Template.find_by(path: params[:template_path])
      end

      def authorize_request
        return if ApiRequestAuthorizer.new(request).authorized?

        render json: { error: 'Not Authorized' }, status: 401
      end
    end
  end
end
