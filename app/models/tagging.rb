class Tagging < ActiveRecord::Base
  belongs_to :tag
  belongs_to :curiosity
end
