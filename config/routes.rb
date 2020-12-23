CmsEngine::Engine.routes.draw do
  resources :resources, only: %i[index new create edit update destroy]
  resources :templates, only: %i[index new create edit update destroy]
  resources :public_keys, only: %i[edit update]

  get 'api/:language/:template_path', to: 'api/resources#index', defaults: { format: :json }
  get 'api/:language/:template_path/:resource_path', to: 'api/resources#show', defaults: { format: :json }

  devise_for :users, class_name: "CmsEngine::User", module: 'devise', skip: [:passwords]

  # only for uploading files
  # mount Ckeditor::Engine => '/ckeditor'

  # TODO - uncomment below, run `rake routes` -> generated routes should work - currently it doesn't work
  # devise_for :users, class_name: "CmsEngine::User", module: 'devise', skip: [:registrations, :passwords]
  # devise_scope :user do
  #   put    '/account',  to: 'devise/registrations#update'
  #   get    '/account',  to: 'devise/registrations#edit',   as: :edit_user_registration
  #   patch  '/account',  to: 'devise/registrations#update', as: :user_registration
  # end

end
