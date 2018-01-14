class DecryptMessagesController < ApplicationController
	skip_before_action :verify_authenticity_token
	def create
		id_mess = params[:id]
		@key = Rsa.find(id_mess)
		@decrypted = CreateDecrypted.new(decrypted: decrypt(params[:message], @key), id_key: id_mess) 
		@decrypted.save
		render plain: @decrypted.decrypted
	end	

private
	def decrypt(message, parameters) 
		decrypted_message = String.new
		message = message.split("f")
		message = message.map {|e| e.to_i}
		message.each do |element|
			element = (element**parameters[:d]) % parameters[:n]
			decrypted_message << element.chr
		end
		decrypted_message 
	end
end
