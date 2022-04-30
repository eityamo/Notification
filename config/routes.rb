Rails.application.routes.draw do
	resources :post_pdf, only: %i[index]
end
