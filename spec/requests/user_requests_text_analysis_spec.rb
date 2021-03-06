RSpec.describe 'POST /api/analyses', types: :request do
  describe 'successfully' do
    before do
      post '/api/analyses', params: {
        analysis: {
          category: 'text',
          resource: 'I just fucking love testing'
        }
      }
    end

    it 'responds with a 201 status' do
      expect(response).to have_http_status 201
    end

    it 'returns a results hash with our initial resource' do
      expected_output = 'I just fucking love testing'
      expect(response_json['results']['text']).to eq expected_output
    end

    it 'returns the correct profanity tag' do
      response = eval(response_json['results']['classifications'])
      expect(response[0]['tag_name']).to eq 'profanity'
    end

    it 'return an appropriate confidence' do
      response = eval(response_json['results']['classifications'])
      expect(response[0]['confidence']).to be > 0.8
    end
  end

  describe 'unsuccessfully' do
    describe 'if category is not correct' do
      before do
        post '/api/analyses', params: {
          analysis: {
            category: 'Lucas',
            resource: 'I just fucking love testing'
          }
        }
      end

      it 'returns an error if category is not correct' do
        expect(response).to have_http_status 422
      end

      it 'returns an proper error message' do
        expect(response_json[0]).to eq 'Category must be text or image'
      end
    end

    describe 'in case resource is empty' do
      before do
        post '/api/analyses', params: {
          analysis: {
            category: 'text',
            resource: ''
          }
        }
      end

      it 'returns an error if resource is empty' do
        expect(response).to have_http_status 422
      end

      it 'returns a proper error message' do
        expect(response_json[0]).to eq "Resource can't be blank"
      end
    end
  end
end
