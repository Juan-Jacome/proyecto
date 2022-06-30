class Formulario < ApplicationRecord
    belongs_to :userlog
    has_many :liquor_formularios
    has_many :liquors, through: :liquor_formularios
    attr_accessor :liquor_favorito

    def save_liquorsfavs
        return liquor_formularios.destroy_all if liquor_favorito.nil? || liquor_favorito.empty?
        
        liquor_formularios.where.not(liquor_id: liquor_favorito).destroy_all
        
        liquor_favorito.each do |liquor_id|
        
          LiquorFormulario.find_or_create_by(formulario: self, liquor_id: liquor_id)
        end
      end

      


end

