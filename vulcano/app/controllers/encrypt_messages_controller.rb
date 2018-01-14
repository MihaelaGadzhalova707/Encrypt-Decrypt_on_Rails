class EncryptMessagesController < ApplicationController
	skip_before_action :verify_authenticity_token  
	def create
		id_mess = params[:id]
		@key = Rsa.find(id_mess)
		@encrypted = CreateEncrypted.new(encrypted: encrypt(params[:message], @key), id_message: id_mess) 
		@encrypted.save
		#redirect_to :action => "show", :id_message => @encrypted[:id_message], :id => @encrypted[:id] and return 0
		render plain: @encrypted.id
	end	
	
	def show
		@encrypted = CreateEncrypted.find(params[:id])
		par = Hash.new
		par[:encrypted] = @encrypted.encrypted
		render json: par
	end

private
	def encrypt(message, parameters)
		encrypted_message = Array.new
		message.bytes.each do |byte|
			byte = ((byte**parameters[:e])% parameters[:n])
			encrypted_message.push(byte)
			encrypted_message.push("f")
		end
		encrypted_message = encrypted_message.join
		encrypted_message 
	end

end
