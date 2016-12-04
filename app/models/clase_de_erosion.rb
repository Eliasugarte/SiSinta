# Mantiene los valores posibles para la clase de Erosión en la ficha de
# Perfiles
class ClaseDeErosion < ActiveRecord::Base
  has_many :erosiones, inverse_of: :clase, foreign_key: 'clase_id'

  validates :valor, presence: true
end
