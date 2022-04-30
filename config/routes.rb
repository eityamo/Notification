Rails.application.routes.draw do
	root 'notifications#index'

	resources :notifications, only: %i[index]
	resources :post_pdf, only: %i[index]
end
