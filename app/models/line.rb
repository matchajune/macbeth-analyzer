class Line < ApplicationRecord
  belongs_to :character
  belongs_to :scene

  has_one :act, through: :scene
end
