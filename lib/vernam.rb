require 'colorize'

class Vernam
	
	attr_writer :mensaje, :clave, :c_1, :c_2
	attr_reader :m_binario, :m_c_binario, :clave, :c_1, :c_2
	
	def initialize
		@mensaje=""
		@clave=""
		@m_binario=""
		@m_c_binario=[]
        @c_1=""
        @c_2=""
	end
	
	def binario
        @m_binario=@mensaje.unpack('B*')
	end
	
	def cifrado
		@m_c_binario=@m_binario[0].unpack('C*').zip(@clave.unpack('C*'))
		@m_c_binario=@m_c_binario.map{ |a,b| a^b }
	end
    
    def super_clave
        @clave=@c_1.unpack('C*').zip(@c_2.unpack('C*'))
        @clave=@clave.map{ |a,b| a^b }.join
    end
    
    def random_binary(length, n=1)
        (1..n).map { "%0#{length}b" % rand(2**length) }
    end
    
    def generate_randoms
        @c_1=random_binary(m_binario.join.bytesize, 1).join
        @c_2=random_binary(m_binario.join.bytesize, 1).join
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
            while mensaje.empty?
				system "clear"
                puts "No se ha introducido mensaje".red
				puts
				print "Introduza el mensaje: "
				mensaje=gets.chomp
			end
			puts
			@test.mensaje=mensaje
            @test.binario
            @test.generate_randoms
            puts "C_1: #{@test.c_1}"
            puts "C_2: #{@test.c_2}"
            @test.super_clave
            puts "Superclave: #{@test.clave}"
			puts "Mensaje original en binario: #{@test.m_binario.join}"
			puts "Longitud del mensaje binario: #{@test.m_binario.join.bytesize}"
			puts
			@test.cifrado
			puts "Mensaje cifrado en binario: #{@test.m_c_binario.join}"
			puts "Mensaje cifrado: #{[@test.m_c_binario.join.to_s].pack('B*')}"
			puts
		when '2'
			system "clear"
			puts
			print "Introduzca el mensaje cifrado: "
			mensaje=gets.chomp
            while mensaje.empty?
				system "clear"
                puts "No se ha introducido mensaje".red
				puts
				print "Introduza el mensaje: "
				mensaje=gets.chomp
			end
			puts
			@test.mensaje=mensaje
            @test.binario
            @test.generate_randoms
            puts "C_1: #{@test.c_1}"
            puts "C_2: #{@test.c_2}"
            @test.super_clave
            puts "Superclave: #{@test.clave}"
			puts "Mensaje cifrado en binario: #{@test.m_binario.join}"
			puts "Longitud del mensaje binario: #{@test.m_binario.join.bytesize}"
			puts
			@test.cifrado
			puts "Mensaje original en binario: #{@test.m_c_binario.join}"
		    puts "Mensaje original: #{[@test.m_c_binario.join.to_s].pack('B*')}"
			puts
		when '3'
			system "clear"
			break
        else
            system "clear"
            puts "La opción introducida es incorrecta".red
            puts
	end
end

=begin
			print "Introduza la clave aleatoria: "
			clave=gets.chomp
            while clave.empty?
				system "clear"
                puts "No se ha introducido clave".red
				puts
				print "Introduza la clave aleatoria: "
				clave=gets.chomp
				puts
			end
			puts
			while clave.bytesize!=@test.m_binario.join.bytesize
				puts "La longitud de la clave es distinta a la del mensaje en binario".red
				puts
				print "Introduza la clave aleatoria: "
				clave=gets.chomp
				puts
			end
			@test.clave=clave
=end

=begin
			print "Introduza la clave aleatoria: "
			clave=gets.chomp
            while clave.empty?
				system "clear"
                puts "No se ha introducido clave".red
				puts
				print "Introduza la clave aleatoria: "
				clave=gets.chomp
				puts
			end
			puts
			while clave.bytesize!=@test.m_binario.join.bytesize
				puts "La longitud de la clave es distinta a la del mensaje en binario".red
				puts
				print "Introduza la clave aleatoria: "
				clave=gets.chomp
				puts
			end
			@test.clave=clave
=end