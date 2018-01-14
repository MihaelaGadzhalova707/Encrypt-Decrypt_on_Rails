RSpec.describe DecryptMessagesController, :type => :controller do
	before(:all) do
		DatabaseCleaner.strategy = :truncation
		DatabaseCleaner.start
	end
	context "POST /rsas/:id/decrypt_messages/"
		it "decrypts \"hello\"" do
			post :create, params: {id:3, message:"166f85f326f326f105f"}
			expect(response.body).to eq "hello"
		end
end
