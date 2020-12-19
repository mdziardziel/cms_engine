CmsEngine::Engine.routes.draw do
  resources :templates, only: %i[index new create edit update destroy]
end
