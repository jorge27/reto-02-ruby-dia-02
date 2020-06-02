class Tablero
	@@width = 0
	@@height = 0
	@@tablero = nil
	@@agents = nil
	def initialize(x,y)
		@width = x
		@height = y
		@tablero = Array.new(@width * @height) {nil}
	end
	def printT
		system "clear"
		for j in 0..@height-1
			for i in 0..@width-1
				if @tablero[i+(j*@width)]
					print "*"
				else
					print " "
				end
			end
			print "\n"
		end
	end

	def registerAgentLive(x, y)
		#    Cualquier agente no registrado, está muerto
		@tablero[(x-1)+((y-1)*@height)] = 1
	end

	def game
		# reglas : 
		# 	1. Si un agente tiene dos o tres agentes vecinos vive, 
		#      pero si tiene menos de 1 o más de tes muere
		#   2. Si una celula muerta tiene 3 vecinas vivas renace
		flag = 0
		for j in 0..@height-1
			for i in 0..@width-1
				@tablero[i+(j*@width)]
				if j-1 >= 0
					if @tablero[(i)+((j-1)*@width)]
						flag++
					end
					if @tablero[(i+1)+((j-1)*@width)]
						flag++
					end
				end
				if i-1 >= 0
					if @tablero[(i-1)+((j1)*@width)]
						flag++
					end
					if @tablero[(i-1)+((j+1)*@width)]
						flag++
					end
				end
			end
			print "\n"
		end
	end
end
 

myTablero = Tablero.new(80,24)

myTablero.printT
