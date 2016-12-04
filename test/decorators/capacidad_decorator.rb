require 'test_helper'

class CapacidadDecoratorTest < ActiveSupport::TestCase
  subject { CapacidadDecorator.new capacidad }
  let(:capacidad) { build :capacidad }

  describe '#to_s' do
    it 'sin subclases es una cadena vacía' do
      subject.to_s.must_equal ''
    end

    it 'devuelve la lista de subclases' do
      capacidad.subclases.build valor: 'a'
      capacidad.subclases.build valor: 'b'

      subject.to_s.must_equal 'a b'
    end
  end
end
