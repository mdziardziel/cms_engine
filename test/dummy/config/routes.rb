Rails.application.routes.draw do
  mount CmsEngine::Engine => "/cms_engine"
end
