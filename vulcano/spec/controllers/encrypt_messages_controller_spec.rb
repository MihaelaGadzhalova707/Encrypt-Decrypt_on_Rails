RSpec.describe EncryptMessagesController, :type => :controller do
	before(:all) do
		DatabaseCleaner.strategy = :truncation
		DatabaseCleaner.start
	end
	context "POST /rsas/:id/encrypt_messages/"
		it "accepts a message and returns id" do
			post :create, params: {id: 3, message: "hello"}
			expect(CreateEncrypted.count).to eq 1
		end
	context "GET /rsas/:id/encrypt_messages/:id"
		it "accepts id and returns json" do
			get :show, params: {id:"1", id_message:"3"}
			expect(response.body).to eq "{\"encrypted\":\"166f85f326f326f105f\"}"
		end
end
