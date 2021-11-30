Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # TODO: there is surely a better way than this big duplicate.
  get '/accounts/:id', to: 'account#show', constraints: { id: /\d/ }
  get '/accounts/:id/sum', to: 'account#sum', constraints: { id: /\d/ }
  get '/accounts/:id/duplicate', to: 'account#duplicate', constraints: { id: /\d/ }
  delete '/accounts/:id', to: 'account#destroy'
  patch '/accounts/:id', to: 'account#update'
  post '/accounts', to: 'account#create'
  get '/accounts(/:order(/:direction))', to: 'account#index'

  get '/banks/:id', to: 'bank#show', constraints: { id: /\d/ }
  delete '/banks/:id', to: 'bank#destroy'
  patch '/banks/:id', to: 'bank#update'
  post '/banks', to: 'bank#create'
  get '/banks(/:order(/:direction))', to: 'bank#index'

  get '/transactions/:id', to: 'transaction#show', constraints: { id: /\d/ }
  delete '/transactions/:id', to: 'transaction#destroy'
  patch '/transactions/:id', to: 'transaction#update'
  post '/transactions', to: 'transaction#create'
  get '/transactions(/:order(/:direction))', to: 'transaction#index'
end
