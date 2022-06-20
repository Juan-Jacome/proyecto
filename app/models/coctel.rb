class Coctel < ApplicationRecord
    has_many :liquor_coctels
    has_many :liquors, through: :liquor_coctels
    attr_accessor :liquor_principal

end
