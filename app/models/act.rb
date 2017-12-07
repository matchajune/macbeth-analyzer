class Act < ApplicationRecord
  default_scope { order(number: :asc) }

  has_many :scenes
  has_many :lines, through: :scenes
  has_many :characters, -> { distinct }, through: :lines
end
