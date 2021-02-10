RSpec.describe 'POST /api/analyses', types: :request do
  describe 'successfully' do
    before do
      post '/api/analyses', params: {
        analysis: {
          category: "text",
          resource: "Hello there Lucas"
        }
      }
    end

    it 'responds with a 201 status' do
      expect(response).to have_http_status 201
    end



  end
  
end