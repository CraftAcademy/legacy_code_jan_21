require 'rails_helper'

RSpec.describe Analysis, type: :model do
  describe 'db table' do
    it { is_expected.to have_db_column :category}
    it { is_expected.to have_db_column :resource}
    it { is_expected.to have_db_column :results}
    it { is_expected.to have_db_column :request_ip}
  end

  describe 'Validations' do
    it { is_expected.to validate_inclusion_of(:category).
      in_array(['text','image']).
      with_message('must be text or image') 
    } 
    it { is_expected.to validate_presence_of :resource}
  end
end

