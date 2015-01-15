

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
  get 'lessons/index'
  # get '/projects/:project_id/lessons(.:format)', to: redirect('/projects/:project_id(.:format)')

  constraints(SubdomainPresent) do
    
    devise_for :users

    devise_scope :user do
      # get "login", to: "devise/sessions#new"
      # get "logout", to: "devise/sessions#destroy"
      get "register", to: "devise/registrations#new"
    end
    
    # resources :users, only: :index
    resources :users
    resources :projects do
      resources :lessons
    end
    
    resources :accounts 

    root 'accounts#index', as: :subdomain_root
  end
  
  constraints(SubdomainBlank) do
    root 'welcome#index'
    resources :accounts, only: [:new, :create, :edit]
  end
end


