Rails.application.routes.draw do

  root 'welcome#home'
  devise_for :employees, :controllers => {registrations: 'registrations'}

  resources :employees do
    resources :sales, only: [:index, :new, :show]
  end
  
  resources :products
  resources :sales
  
  delete 'products/:id', to: 'products#destroy'


  



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
