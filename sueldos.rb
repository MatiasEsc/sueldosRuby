require "cucumber"

class Retencion

  @@LEY19032 = 0.03
  @@OBRA_SOCIAL = 0.03
  @@JUBILACIOn = 0.11
  @@MIN_IMP = 30000

  # devuelve el sueldo con descuentos aplicados
  def aplicar(sueldoEnBruto)
    @sueldoConRetenciones = sueldoEnBruto - (sueldoEnBruto * (@@JUBILACIOn + @@LEY19032 + @@OBRA_SOCIAL))
    @sueldoConRetenciones - self.impuestoGanancias(sueldoEnBruto)
  end

  def impuestoGanancias(sueldoEnBruto)
    if self.sueldoBruto > 30000
      (self.sueldoBruto - 30000) * 0.2
    else
      0
    end
  end

end

class Peon

  @@valorXhora
  @@horasTrabajadas
  @@estaAfiliado

  def initialize(hora, valor, estaAfiliado)
    @@horasTrabajadas = hora
    @@valorXHora = valor
    @@estaAfiliado = estaAfiliado
  end

  def sueldoBruto
    return @sueldoBruto = @horasTrabajadas * @valorXHora
  end

  def descuentoPorAfiliacion
    if @estaAfiliado
      0.01
    else
      0
    end
  end

  def sueldoNeto
    @retenciones = Retencion.new
    @sueldoNeto = @retenciones.aplicar(self.sueldoBruto)
  end
end

class MedioOficial < Peon

  def initialize(hora, valor)
    @@horasTrabajadas = hora
    @@valorXHora = @@valorXHora + (@@valorXHora * 0.05)
  end

end

class Oficial < Peon

  @@cumplioObjetivo

  def initialize(hora, valor, estaAfiliado)
    super
    @@valorXHora = @@valorXHora * 0.1 + @@valorXHora
    @@CumplioObjetivo = true
  end

  def sueldoBruto
    @SueldoBrutoBase = @@horasTrabajadas * @@valorXHora
    if @@CumplioObjetivo
      return @SueldoBrutoBase + @sueldoBrutoBase * 0.30
    else
      @sueldoBrutoBase
    end


  end


  class Capataz < Oficial

    @@PLUS_SALARIO = 4000

    def initialize(hora, valor)
      @horasTrabajadas = hora
      @valorXHora = valor * 0.1 + valor
    end

    def sueldoBruto
      @calculoSueldo = super + @@PLUS_SALARIO
    end

  end


  class Empresa

    def initialize
      @@empleados = []
    end

    def agregarEmpleado(personal)
      @@empleados.push(personal)
    end

    def sueldoMasAlto
      @empleadoSueldos = []
      @@empleados.max
      @@empleados.each do |empleado|
        @empleadoSueldos.push(empleado.sueldoNeto)
      end
      @empleadoSueldos.max
    end

    def sueldoMasBajo
      @empleadoSueldoMenor = @@empleados.min_by {|em| em.sueldoNeto}
      return @emppleadoSueldoMenor.sueldoNeto
    end

    def cantidadDeEmpleados
      return @@empleados.size
    end

    def cantidadDeEmpleadosTipo(tipo)
      return @@empleados.count {|x| x.class == tipo}
    end

    def mediaSueldoBruto
      @sumaSueldo = @@empleados.sum{ |empleado| empleado.sueldoBruto }
      return @sumaSueldo / @@empleados.size
    end


    def mediaSueldoBrutoTipo(tipo)
      @empleadoDeUnTipo = @@empleados.select {|e| e.equal?(tipo)}
      @sumaSueldo =   @empleadoDeUnTipo.sum{|e| e.sueldoBruto }
      @sumaSueldo / @empleadoDeUnTipo.size
    end

  end

  pepe = Peon.new(120, 200, true)
  pepe.sueldoBruto
  pepe.afiliadoAlGremio?(true)
  pepe.impuestoGanancias
  pepe.sueldoNeto

  lopez = Peon.new(130, 200, true)
  lopez.sueldoBruto
  lopez.afiliadoAlGremio?(true)
  lopez.impuestoGanancias
  lopez.sueldoNeto

  homero = Capataz.new(120, 350)
  homero.sueldoBruto
  homero.objetivoCumplido?(true)
  homero.impuestoGanancias
  homero.sueldoNeto

  wenance = Empresa.new
  wenance.agregarEmpleado(pepe)
  wenance.agregarEmpleado(lopez)
  wenance.agregarEmpleado(homero)
