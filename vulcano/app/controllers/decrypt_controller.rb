require "RSA"

class DecryptMessagesController < ApplicationController
	before_action :set_message, only: [:show]

	def create

		msg = DecryptMessage.new()

		mesg.content = params[:msg]

		key = Key.find(params[:id])

		rsa = RSA.new(key.n, key.e, key.d)

		message.content = rsa.decrypt(message.content)

		respond_to do |format|
			if msg.save
				format.json {
					render :json => {'message' => msg.content}
				}
			end
		end
	end

private
	def set_message
		@msg = EncryptMessage.find(params[:id])
	end

	def message_params
		#write some code here
	end
end
