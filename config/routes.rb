Rails.application.routes.draw do
	root 'records#new'

	get '/records', to: 'records#new'
	resources :records, only: %i[create]
end
