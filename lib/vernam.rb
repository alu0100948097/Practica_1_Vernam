class Vernam
	
	attr_writer :mensaje, :clave
	
	def initialize
		@mensaje=""
		@clave=""
		@m_binario=""
	end
	
	def binario
        @m_binario=@mensaje.unpack('B*')
        puts "Mensaje en binario: #{@m_binario.join}"
        puts "Longitud del mensaje: #{@m_binario.join.bytesize}"
		puts
		
	end
	
	def cifrado
		m_c_binario=@m_binario[0].unpack('C*').zip(@clave.unpack('C*'))
		m_c_binario=m_c_binario.map{ |a,b| a^b }
		puts "Mensaje cifrado en binario: #{m_c_binario.join}"
		puts "Mensaje cifrado: #{[m_c_binario.join.to_s].pack('B*')}"
	end
	
end

@test=Vernam.new
puts
puts "Introduzca el mensaje original:"
mensaje=gets.chomp
puts
@test.mensaje=mensaje
@test.binario
puts "Introduza clave:"
clave=gets.chomp
puts
@test.clave=clave
@test.cifrado
puts