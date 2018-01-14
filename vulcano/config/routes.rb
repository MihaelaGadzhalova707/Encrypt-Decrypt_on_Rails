Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	resources 'rsas'
	post '/rsas/:id/encrypt_messages/', to: 'encrypt_messages#create'
	get '/rsas/:id_message/encrypt_messages/:id', to: 'encrypt_messages#show'
	post '/rsas/:id/decrypt_messages/', to: 'decrypt_messages#create'
end
