# rails_debugging_guide.rb
#
# Guía completa sobre debugging en Ruby on Rails
# Aprende a depurar código en Rails con diferentes herramientas y técnicas.

# =============================
# 1️⃣ Uso de `debugger`
# =============================
# Rails ya incluye la gema 'debug' por defecto en Rails 7. 
# Para detener la ejecución en cualquier punto del código, usa:

require 'debug'

def test_debugger
  a = 10
  b = 5
  debugger  # ⏸ La ejecución se detendrá aquí en la terminal
  c = a + b
  puts "La suma es: #{c}"
end

test_debugger  # Ejecuta esta función en un script de Rails para probar

# =============================
# 2️⃣ Uso de `byebug` (Rails < 7)
# =============================
# En versiones anteriores de Rails (< 7), se usaba `byebug` para depuración.
# Primero, instala la gema si no la tienes: `gem install byebug`

require 'byebug'

def test_byebug
  x = 100
  y = 200
  byebug  # ⏸ Se detiene aquí y permite inspeccionar las variables
  z = x * y
  puts "El resultado es: #{z}"
end

test_byebug

# =============================
# 3️⃣ Uso de `binding.irb` (Alternativa moderna)
# =============================
# `binding.irb` te permite abrir una sesión IRB en cualquier parte del código.

def test_binding_irb
  nombre = "Karina"
  edad = 21
  binding.irb  # 🛑 Se detiene y abre una sesión interactiva IRB
  puts "Nombre: #{nombre}, Edad: #{edad}"
end

test_binding_irb

# =============================
# 4️⃣ Uso de la Web Console en Rails
# =============================
# La Web Console permite inspeccionar variables en el navegador.
# Solo funciona en entornos de desarrollo.

# En un controlador Rails (app/controllers/products_controller.rb)
class ProductsController < ApplicationController
  def index
    @products = Product.all
    console  # 📌 Activa la Web Console en el navegador
    render json: @products
  end
end

# 📌 Nota: Solo se puede usar `console` **una vez** por solicitud HTTP

# =============================
# 5️⃣ Debugging en modelos (ActiveRecord)
# =============================
# Podemos usar `debugger`, `byebug` o `binding.irb` en modelos para inspeccionar datos

class Product < ApplicationRecord
  before_save :calculate_discount

  def calculate_discount
    debugger  # ⏸ Pausa antes de calcular el descuento
    self.discounted_price = price * 0.9
  end
end

# =============================
# 6️⃣ Debugging en Background Jobs (ActiveJob)
# =============================
class SendEmailJob < ApplicationJob
  queue_as :default

  def perform(user)
    debugger  # 🛑 Pausa en la ejecución del job
    UserMailer.welcome_email(user).deliver_now
  end
end

# =============================
# 7️⃣ Uso de breakpoints en Rails
# =============================
# También podemos definir puntos de interrupción en la terminal sin modificar el código.

# PASOS:
# 1. Agrega `debugger` en cualquier parte de tu código.
# 2. Inicia tu servidor Rails: `rails server`
# 3. Cuando el código se detiene en `debugger`, usa `break [línea]` en la terminal
#    Ejemplo: `break 20` para detenerse en la línea 20.

# =============================
# 🎯 Conclusión
# =============================
# 🔹 Usa `debugger` para depurar en Rails 7+
# 🔹 Usa `byebug` para Rails 6 y anteriores
# 🔹 Usa `binding.irb` para una sesión IRB interactiva
# 🔹 Usa `console` para depuración en el navegador
# 🔹 Usa breakpoints para inspeccionar código sin modificar archivos

# 🚀 ¡Feliz Debugging en Rails! 🚀
