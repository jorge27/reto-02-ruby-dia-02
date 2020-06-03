class Tablero
	@@width = 0
	@@height = 0
	@@tablero = nil
	def initialize(x,y)
		@width = x
		@height = y
		@tablero = Array.new(@width){Array.new(@height){nil}}
	end
	def printTablero
		system "clear"
		(0..@width-1).each do |i|
			(0..@height-1).each do |j|
				if @tablero[i][j]
					print "*"
				else
					print " "
				end
			end
			print "\n"
		end
	end

	def initCell(x, y)
		@tablero[x-1][y-1] = 1
	end

	def execGame
		maxX = @width-1
		maxY = @height-1
		tablero = Array.new(@width) { Array.new(@height) { nil  }  }
		(0..maxX).each do |i|
			(0..maxY).each do |j|
				flag = 0
				if (i>0) && (j>0)
					if @tablero[i-1][j-1] 
						flag = flag+1
					end	
				end
				if (j>0)
					if @tablero[i][j-1] 
						flag = flag+1
					end	
				end
				if (i<maxX) && (j>0)
					if @tablero[i+1][j-1] 
						flag = flag+1
					end	
				end
				if (i>0)
					if @tablero[i-1][j] 
						flag = flag+1
					end	
				end
				if (i<maxX)
					if @tablero[i+1][j] 
						flag = flag+1
					end	
				end
				if (i>0) && (j<maxY)
					if @tablero[i-1][j+1] 
						flag = flag+1
					end	
				end
				if (j<maxY)
					if @tablero[i][j+1] 
						flag = flag+1
					end	
				end
				if (i<maxX) && (j<maxY)
					if @tablero[i+1][j+1] 
						flag = flag+1
					end	
				end
				if ((flag==2) || (flag==3)) && (@tablero[i][j])
					tablero[i][j] = 1
				else
					tablero[i][j] = nil
				end

				if (!@tablero[i][j]) && (flag==3)
					tablero[i][j] = 1
				end

			end
		end
		@tablero = tablero.clone
	end
end
 

myTablero = Tablero.new(23,80)
myTablero.initCell(10,10)
myTablero.initCell(10,11)
myTablero.initCell(10,12)

myTablero.initCell(20,10)
myTablero.initCell(20,11)
myTablero.initCell(20,12)

myTablero.initCell(18,31)
myTablero.initCell(18,32)
myTablero.initCell(18,33)

while 1 do
	myTablero.printTablero
	myTablero.execGame
	sleep(0.5)	
end

