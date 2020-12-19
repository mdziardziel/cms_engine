CmsEngine::Engine.routes.draw do
  resources :resources, only: %i[index new create edit update destroy]
  resources :templates, only: %i[index new create edit update destroy]
end
