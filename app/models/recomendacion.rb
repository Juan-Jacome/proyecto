class Recomendacion < ApplicationRecord
  belongs_to :liquor_coctel
  belongs_to :formulario
end
