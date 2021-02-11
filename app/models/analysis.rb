class Analysis < ApplicationRecord
  validates :category, inclusion: { 
    in: ['text','image'], 
    message: 'must be text or image' 
  }
  validates_presence_of :resource
end
