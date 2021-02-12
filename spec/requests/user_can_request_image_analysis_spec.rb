RSpec.describe 'POST /api/analyses', types: :request do
  describe 'successfully' do
    before do
      post '/api/analyses', params: {
        analysis: {
          category: 'image',
          resource: 'https://metro.co.uk/wp-content/uploads/2014/11/1400x931390-e1416921236602.jpg'
        }
      }
    end

    it 'responds with a 201 status' do
      binding.pry
      expect(response).to have_http_status 201
    end

    it 'returns a results hash with our initial resource' do
      
      expected_output = 'I just fucking love testing'
      expect(response_json['results']['text']).to eq expected_output
    end

  end
end