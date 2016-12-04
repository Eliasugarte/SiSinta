# En este archivo va la carga inicial de datos. La mayoría de estos datos
# residen en db/semillas/, en diferentes archivos y formatos. Acá se realiza la
# carga.
require 'csv'
require 'seeds_helper'

include SeedsHelper

load 'db/semillas/admin.rb'
load 'db/semillas/colores.rb'
load 'db/semillas/fichas.rb'

load 'db/semillas/drenajes.rb'
load 'db/semillas/escurrimientos.rb'
load 'db/semillas/pendientes.rb'
load 'db/semillas/permeabilidades.rb'
load 'db/semillas/relieves.rb'
load 'db/semillas/anegamientos.rb'
load 'db/semillas/usos_de_la_tierra.rb'
load 'db/semillas/posiciones.rb'
load 'db/semillas/sales.rb'
load 'db/semillas/texturas.rb'
