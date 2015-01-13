

class SubdomainPresent
  def self.matches?(request)
    request.subdomain.present?
  end
end

class SubdomainBlank
  def self.matches?(request)
    request.subdomain.blank?
  end
end

Rails.application.routes.draw do
  constraints(SubdomainPresent) do
    
    devise_for :users

    devise_scope :user do
      # get "login", to: "devise/sessions#new"
      # get "logout", to: "devise/sessions#destroy"
      get "register", to: "devise/registrations#new"
    end
    
    # resources :users, only: :index
    resources :users
    resources :projects, except: [:index, :show, :destroy]
    root 'accounts#index', as: :subdomain_root
  end
  
  constraints(SubdomainBlank) do
    root 'welcome#index'
    resources :accounts, only: [:new, :create]
  end
end


