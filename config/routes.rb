Rails.application.routes.draw do
	root 'records#new'

	get '/records', to: 'records#new'
	get 'terms', to: 'records#terms'
  get 'privacy_policy', to: 'records#privacy_policy'
	resources :records, only: %i[create]
end
