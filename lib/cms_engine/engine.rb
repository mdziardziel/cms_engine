module CmsEngine
  class Engine < ::Rails::Engine
    isolate_namespace CmsEngine

    config.to_prepare do
      Devise::SessionsController.layout 'application'
    end
  end
end
