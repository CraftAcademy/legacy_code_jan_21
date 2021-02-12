RSpec.describe 'POST /api/analyses', types: :request do
  describe 'successfully' do
    before do
      post '/api/analyses', params: {
        analysis: {
          category: 'image',
          resource: 'https://pbs.twimg.com/media/B9ahb_-IcAEqVFL.jpg'
        }
      }
    end

    it 'responds with a 201 status' do
      expect(response).to have_http_status 201
    end

    it 'returns a results hash with our initial resource' do
      expected_output = 'https://pbs.twimg.com/media/B9ahb_-IcAEqVFL.jpg'
      expect(response_json['resource']).to eq expected_output
    end

    it 'returns the correct explicit value' do
      expect(response_json['results']['explicit'].to_f).to be > 0.8
    end

  end
end