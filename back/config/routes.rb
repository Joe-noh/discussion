Rails.application.routes.draw do
  devise_for :users, controllers: {sessions: 'sessions', registrations: 'registrations'}

  namespace :api do
    get '/csrf', to: 'csrf#index'
  end
end
