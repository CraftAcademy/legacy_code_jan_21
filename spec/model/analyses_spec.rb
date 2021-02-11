require 'rails_helper'

RSpec.describe Analysis, type: :model do

  describe 'Validations' do
    it { is_expected.to validate_inclusion_of(:category).
      in_array(['text','image']).
      with_message('must be text or image') 
    } 
    it { is_expected.to validate_presence_of :resource}
  end

end

