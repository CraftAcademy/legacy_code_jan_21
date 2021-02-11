RSpec.describe 'POST /api/analyses', types: :request do
  describe 'successfully' do
    before do
      post '/api/analyses', params: {
        analysis: {
          category: "text",
          resource: "I just fucking love testing"
        }
      }
    end

    it 'responds with a 201 status' do
      expect(response).to have_http_status 201
    end

    it 'returns a result' do
      expect(response_json['results']).to be_truthy
    end 

  
  end
end