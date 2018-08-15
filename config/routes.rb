Rails.application.routes.draw do
  devise_for :users
  get "contact",to: "pages#contact"
  get "about", to: "pages#about"
  get "error", to: "pages#error"

  get "blog",to: redirect("http://alimalik11512.blogspot.com/2015/01/register.html")
  
  resources :projects do
    resources :tasks, except: [:index]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "pages#home"

  get "*path",to: redirect("/error")

end
