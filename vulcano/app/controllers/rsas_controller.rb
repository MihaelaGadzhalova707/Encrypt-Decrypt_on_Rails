class RsasController < ApplicationController
	protect_from_forgery except: :create
	def index
	end
	def create
		if params.has_key?(:n) and params.has_key?(:e) and params.has_key?(:d)
			@RSA = Rsa.new(n: params[:n], e: params[:e], d: params[:d])
		else
			parameters = new_key
			@RSA = Rsa.new(n: parameters[0], e: parameters[1], d: parameters[2])  
		end
		@RSA.save
		render plain: @RSA.id
	end
	
	def show
		@key = Rsa.find(params[:id])
		par = Hash.new
		par[:n] = @key.n
		par[:e] = @key.e
		par[:d] = @key.d
		render json: par
	end

private
	def generate_rand
		seed = Random.new_seed 
		while true
			a = Random.new.rand(1..1000)
			if is_prime? a then break
			end
		end	
		a
	end

	def is_prime? a
		state = true
		for i in 2...a
			if a%i == 0
				state = false
			end 
		end
		state
	end
	
	def new_key
		p = generate_rand
		q = generate_rand

		n = p*q
		lambda_n = (p-1).lcm(q-1)
		while true
			e = generate_rand
			if e < lambda_n and lambda_n % e != 0 
				break
			end
		end
		for d_ in 1..lambda_n
			if (d_*e)%lambda_n == 1
				d = d_
				break
			end
		end
		toReturn = Array.new
		toReturn[0] = n
		toReturn[1] = e
		toReturn[2] = d
		toReturn
	end
end
