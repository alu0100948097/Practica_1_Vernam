class Vernam
	
	attr_writer :mensaje, :clave
	attr_reader :m_binario, :m_c_binario
	
	def initialize
		@mensaje=""
		@clave=""
		@m_binario=""
		@m_c_binario=[]
	end
	
	def binario
        @m_binario=@mensaje.unpack('B*')
	end
	
	def cifrado
		@m_c_binario=@m_binario[0].unpack('C*').zip(@clave.unpack('C*'))
		@m_c_binario=@m_c_binario.map{ |a,b| a^b }
	end
end

@test=Vernam.new

loop do
	puts "PRACTICA: CIFRADO DE VERNAM"
	puts "1: Cifrar"
	puts "2: Descifrar"
	puts "3: Salir"
	print 'Introduzca una opcion: '
	opcion = gets.chomp
	case opcion
		when '1'
			system "clear"
			puts
			print "Introduzca el mensaje original: "
			mensaje=gets.chomp
			puts
			@test.mensaje=mensaje
			@test.binario
			puts "Mensaje original en binario: #{@test.m_binario.join}"
			puts "Longitud del mensaje binario: #{@test.m_binario.join.bytesize}"
			puts
			print "Introduza la clave aleatoria: "
			clave=gets.chomp
			puts
			@test.clave=clave
			@test.cifrado
			puts "Mensaje cifrado en binario: #{@test.m_c_binario.join}"
		    puts "Mensaje cifrado: #{[@test.m_c_binario.join.to_s].pack('B*')}"
			puts
		when '2'
			system "clear"
			puts
			print "Introduzca el mensaje cifrado: "
			mensaje=gets.chomp
			puts
			@test.mensaje=mensaje
			@test.binario
			puts "Mensaje cifrado en binario: #{@test.m_binario.join}"
			puts "Longitud del mensaje binario: #{@test.m_binario.join.bytesize}"
			puts
			print "Introduza la clave aleatoria: "
			clave=gets.chomp
			puts
			@test.clave=clave
			@test.cifrado
			puts "Mensaje original en binario: #{@test.m_c_binario.join}"
		    puts "Mensaje original: #{[@test.m_c_binario.join.to_s].pack('B*')}"
			puts
		when '3'
			system "clear"
			break
	end
end