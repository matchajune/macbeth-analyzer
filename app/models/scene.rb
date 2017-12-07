class Scene < ApplicationRecord
  belongs_to :act

  has_many :lines
  has_many :characters, through: :lines
end
