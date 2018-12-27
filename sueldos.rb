require "cucumber"

class Peon

  def initialize(hora,valor)
    @horasTrabajadas = hora
    @valorXHora = valor
  end

  def sueldoBruto
    return @sueldoBruto = @horasTrabajadas * @valorXHora
  end

  def impuestoGanancias
    if self.sueldoBruto > 30000
      @impuestoGanancias = (self.sueldoBruto - 30000) * 0.2
    else
      @impuestoGanancias = 0
    end
  end

  def afiliadoAlGremio?(valor)
    if  valor == true
      @descuentoGremio = 0.01
    else
      @descuentoGremio = 0
    end
  end

  def sueldoNeto
    @sueldoNeto = @sueldoBruto - ((self.sueldoBruto * (0.17 + @descuentoGremio)) - @impuestoGanancias)
  end
end

class MedioOficial

  def initialize(hora,valor)
    @horasTrabajadas = hora
    @valorXHora = valor * 0.05 + valor
  end

  def sueldoBruto
    return @sueldoBruto = @horasTrabajadas * @valorXHora
  end

  def impuestoGanancias
    if self.sueldoBruto > 30000
      @impuestoGanancias = (self.sueldoBruto - 30000) * 0.2
    else
      @impuestoGanancias = 0
    end
  end


  def afiliadoAlGremio?(valor)
    if  valor == true
      @descuentoGremio = 0.01
    else
      @descuentoGremio = 0
    end
  end

  def sueldoNeto
    @sueldoNeto = @sueldoBruto - ((self.sueldoBruto * (0.17 + @descuentoGremio)) - @impuestoGanancias)
  end

end


class Oficial

  def initialize(hora,valor)
    @horasTrabajadas = hora
    @valorXHora = valor * 0.1 + valor
  end

  def impuestoGanancias
    if self.sueldoBruto > 30000
      @impuestoGanancias = (self.sueldoBruto - 30000) * 0.2
    else
      @impuestoGanancias = 0
    end
  end

  def objetivoCumplido?(valor)
    if  valor == true
      @sueldoBrutoFinal = (self.sueldoBruto * 0.30) + (self.sueldoBruto / 0.30)
      @sueldoBrutoFinal = @sueldoBrutoFinal + self.sueldoBruto
    else
      @sueldoBrutoFinal = self.sueldoBruto
    end

  end

  def sueldoBruto
     return @horasTrabajadas * @valorXHora
  end

  def afiliadoAlGremio?(valor)
    if  valor == true
      @descuentoGremio = 0.01
    else
      @descuentoGremio = 0
    end
  end

  def sueldoNeto
    @sueldoNeto = @sueldoBrutoFinal - ((@sueldoBrutoFinal * (0.17 + @descuentoGremio)) - @impuestoGanancias)
  end

end


class Capataz

  def initialize(hora,valor)
    @horasTrabajadas = hora
    @valorXHora = valor * 0.1 + valor
  end

  def impuestoGanancias
    if self.sueldoBruto > 30000
      @impuestoGanancias = (self.sueldoBruto - 30000) * 0.2
    else
      @impuestoGanancias = 0
    end
  end

  def objetivoCumplido?(valor)
    if  valor == true
      @sueldoBrutoFinal = (self.sueldoBruto * 0.30) + (self.sueldoBruto / 0.30)
      @sueldoBrutoFinal = @sueldoBrutoFinal + self.sueldoBruto
    else
      @sueldoBrutoFinal = self.sueldoBruto
    end
  end

  def sueldoBruto
    return (@horasTrabajadas * @valorXHora) + 4000
  end

  def sueldoNeto
    @sueldoNeto = @sueldoBrutoFinal - ((@sueldoBrutoFinal * 0.17) - @impuestoGanancias)
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
      @@empleados.each do |empleado|
         @empleadoSueldos.push(empleado.sueldoNeto)
      end
      @empleadoSueldos.max
  end

  def sueldoMasBajo
      @empleadoSueldos = []
      @@empleados.each do |empleado|
         @empleadoSueldos.push(empleado.sueldoNeto)
      end
      @empleadoSueldos.min
  end

  def cantidadDeEmpleados
    return @@empleados.size
  end

  def cantidadDeEmpleadosTipo(tipo)
    return @@empleados.count { |x| x.class == tipo }
  end

  def mediaSueldoBruto
    @mediaSueldoBruto = 0
    @@empleados.each do |empleado|
      @mediaSueldoBruto = @mediaSueldoBruto + empleado.sueldoBruto
    end
    return @mediaSueldoBruto = @mediaSueldoBruto / @@empleados.size
  end


  def mediaSueldoBrutoTipo(tipo)
    @mediaSueldoBruto = 0
    @@empleados.each do |empleado|
      if empleado.class == tipo
      @mediaSueldoBruto = @mediaSueldoBruto + empleado.sueldoBruto
      end
    end
    return @mediaSueldoBruto = @mediaSueldoBruto / @@empleados.count { |x| x.class == tipo }
  end

end

pepe = Peon.new(120,200)
pepe.sueldoBruto
pepe.afiliadoAlGremio?(true)
pepe.impuestoGanancias
pepe.sueldoNeto

lopez = Peon.new(130,200)
lopez.sueldoBruto
lopez.afiliadoAlGremio?(true)
lopez.impuestoGanancias
lopez.sueldoNeto

homero = Capataz.new(120,350)
homero.sueldoBruto
homero.objetivoCumplido?(true)
homero.impuestoGanancias
homero.sueldoNeto

wenance = Empresa.new
wenance.agregarEmpleado(pepe)
wenance.agregarEmpleado(lopez)
wenance.agregarEmpleado(homero)
