class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :curiosities, through: :taggings
end
