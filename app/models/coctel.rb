class Coctel < ApplicationRecord
    has_many :liquor_coctels
    has_many :liquors, through: :liquor_coctels

    has_many :coctel_formularios
    has_many :formularios, through: :coctel_formularios

    attr_accessor :liquor_principal

    def save_liquors
        return liquor_coctels.destroy_all if liquor_principal.nil? || liquor_principal.empty?
        
        liquor_coctels.where.not(liquor_id: liquor_principal).destroy_all
        
        liquor_principal.each do |liquor_id|
        
          LiquorCoctel.find_or_create_by(coctel: self, liquor_id: liquor_id)
        end
      end

end
