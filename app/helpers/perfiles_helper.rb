# encoding: utf-8
module PerfilesHelper
  include PaginacionHelper
  include AnaliticosHelper

  # Para checkear si debería estar marcado o no el checkbox de la subclase
  # correspondiente
  def tildada?(s)
    @perfil.capacidad.try(:subclases).include?(s)
  end

  # Para el +FormHelper+ necesito los objetos instanciados, aunque no tengan
  # asociaciones realizadas, asique acá les asignamos un objeto nuevo si no
  # tenían ya
  def horizonte_preparado
    Horizonte.new(
      profundidad_superior:
        @perfil.horizontes.empty? ? 0 : @perfil.horizontes.last.profundidad_inferior,
      color_seco: Color.new,
      color_humedo: Color.new,
      limite: Limite.new,
      consistencia: Consistencia.new,
      estructura: Estructura.new
    )
  end

  def titulo_de_la_accion
    case params[:action]
      when 'index'
        'Perfiles'
      when 'show'
        "Perfil #{@perfil.numero}"
      when 'new'
        'Nuevo perfil'
      when 'edit'
        "Editando perfil #{@perfil.numero}"
      when 'exportar'
        'Exportar perfiles'
      when 'permisos'
        "Permisos para el perfil #{@recurso.numero}"
      else
        nil
    end
  end

  def atributos
    @atributos ||= Perfil.atributos_y_asociaciones(excepto: [
      :created_at, :updated_at, :adjuntos, :horizontes, :etiquetas_taggings,
      :reconocedores_taggings, :taggings, :usuario, :roles ])
  end

  def marcados
    @marcados = if self.checks_csv_marcados.any?
      self.checks_csv_marcados.map(&:to_sym)
    else
      [ :id, :numero, :fecha, :serie, :ubicacion ]
    end
  end

  protected

    def checks_csv_marcados
      Array.wrap current_usuario.checks_csv_perfiles
    end
end
