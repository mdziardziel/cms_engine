require "active_model_serializers"

module CmsEngine
  class Engine < ::Rails::Engine
    isolate_namespace CmsEngine

    config.to_prepare do
      Devise::SessionsController.layout 'cms_engine/login_layout'
    end
  end
end
