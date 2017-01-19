Rails.application.routes.draw do
  get   '/import' => 'kaki_limas#newImport'
  post  '/import' => 'kaki_limas#saveImport'
  post   '/search' => 'kaki_limas#search'

  resources :kaki_limas

  root 'kaki_limas#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
