# encoding: utf-8
class Capacidad < ActiveRecord::Base
  attr_accessible :clase_id, :subclase_ids

  belongs_to :perfil, inverse_of: :capacidad

  has_lookup :clase, inverse_of: :capacidades,
              class_name: 'ClaseDeCapacidad'

  # Pseudoasociación HABTM con SubclaseDeCapacidad. Permite modificarla
  # mediante   # +subclase_ids+ o mediante +subclases+
  serialize :subclase_ids, Array
  guardar_como_arreglo :subclase, SubclaseDeCapacidad
  attr_accessor :subclases

  validates_presence_of :perfil
  delegate :publico, :usuario, :usuario_id, to: :perfil

  # TODO A un decorator
  def to_s
    cadena = "#{clase_de_capacidad.try(:to_str)}"
    subclases.each do |sc|
      cadena << ' ' << sc
    end
    return cadena
  end
end
