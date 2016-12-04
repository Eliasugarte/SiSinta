# Traits y métodos generales para todas las factories

# Falsear uploads en rack
include ActionDispatch::TestProcess

FactoryGirl.define do
  sequence :cadena_unica, 'a'

  sequence :porcentaje do
    rand(100) * 0.01
  end

  sequence :email do |n|
    "mail-numero-#{n}@falso.com"
  end

  # Hay varios modelos que pueden o no tener un perfil asociado
  trait :sin_perfil do
    perfil nil
  end

  trait :con_perfil do
    perfil
  end
end
