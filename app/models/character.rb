class Character < ApplicationRecord
  default_scope { order(name: :asc) }

  has_many :lines
  has_many :scenes, -> { distinct }, through: :lines
  has_many :acts,   -> { distinct }, through: :scenes

end
