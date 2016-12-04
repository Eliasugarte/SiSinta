# Creación de modelos para los tests. Sin argumentos ni traits debería crear
# modelos que pasen la validación.
FactoryGirl.define do
  factory :anegamiento do
    valor { generate :cadena_unica }
  end
end
