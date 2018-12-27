require "./sueldos.rb"
Dado(/^que ingreso empleados a la empresa '(.*)''(.*)''(.*)''(.*)'$/) do |empleado, nombre, hora, cantidad|
  nombre = empleado.new(120,200)
  nombre.sueldoBruto
  nombre.afiliadoAlGremio?(true)
  nombre.impuestoGanancias
  nombre.sueldoNeto
end

Entonces("debo calcular") do
  pending # Write code here that turns the phrase above into concrete actions
end
