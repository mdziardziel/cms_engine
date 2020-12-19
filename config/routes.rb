CmsEngine::Engine.routes.draw do
  resources :resources
  resources :templates, only: %i[index new create edit update destroy]
end
