class Vernam
	
	def initialize(msj,c)
		@mensaje=msj
		@clave=c
	end
	
	def binario
        m_binario=@mensaje.unpack('B*').join
        puts "Mensaje en binario: #{m_binario}"
        puts "Longitud del mensaje: #{m_binario.bytesize}"
	end
	
end

puts "Introduzca el mensaje original:"
mensaje=gets.chomp
puts "Introduza clave:"
clave=gets.chomp.to_i
@test=Vernam.new(mensaje,clave)
@test.binario