class LiquorCoctel < ApplicationRecord
  belongs_to :coctel
  belongs_to :liquor

  has_many :recomendaciones
  has_many :formularios, through: :recomendaciones

end
