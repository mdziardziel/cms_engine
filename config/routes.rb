CmsEngine::Engine.routes.draw do
  resources :templates, only: %i[index new create edit update destroy]

  devise_for :users, class_name: "CmsEngine::User", module: 'devise', skip: [:passwords]

  # TODO - uncomment below, run `rake routes` -> generated routes should work - currently it doesn't work
  # devise_for :users, class_name: "CmsEngine::User", module: 'devise', skip: [:registrations, :passwords]
  # devise_scope :user do
  #   put    '/account',  to: 'devise/registrations#update'
  #   get    '/account',  to: 'devise/registrations#edit',   as: :edit_user_registration
  #   patch  '/account',  to: 'devise/registrations#update', as: :user_registration
  # end

end
