class Vernam
	
	def initialize(msj,c)
		@mensaje=msj
		@clave=c
		@m_binario=""
	end
	
	def binario
        @m_binario=@mensaje.unpack('B*')
        puts "Mensaje en binario: #{@m_binario.join}"
        puts "Longitud del mensaje: #{@m_binario.join.bytesize}"
		
	end
	
	def cifrado
		m_c_binario=@m_binario[0].unpack('C*').zip(@clave.unpack('C*'))
		m_c_binario=m_c_binario.map{ |a,b| a^b }
		puts "Mensaje cifrado en binario: #{m_c_binario.join}"
		puts "Mensaje cifrado: #{[m_c_binario.join].pack('B*')}"
	end
	
end

puts "Introduzca el mensaje original:"
mensaje=gets.chomp
puts "Introduza clave:"
clave=gets.chomp
@test=Vernam.new(mensaje,clave)
@test.binario
@test.cifrado