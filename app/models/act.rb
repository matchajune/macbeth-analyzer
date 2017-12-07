class Act < ApplicationRecord
  has_many :scenes
  has_many :lines, through: :scenes
  has_many :characters, -> { distinct }, through: :lines
end
