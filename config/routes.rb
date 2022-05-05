Rails.application.routes.draw do
	root 'records#new'

	resources :records, only: %i[new create]
end
