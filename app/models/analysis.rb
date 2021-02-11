class Analysis < ApplicationRecord
  validates :category, inclusion: { 
    in: ['text','image'], 
    message: 'must be text or image' 
  }
end
