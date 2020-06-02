$tablero = Array.new(23){Array.new(80){0}}

## => Ejecutando las reglas del juego
def execGame 
	flag = 0
	(0..22).each do |i|
		(0..79).each do |j|
			if i > 0 && j > 0
				if $tablero[i-1][j-1]
					flag = flag + 1
				end
			end
			if j > 0
				if $tablero[i][j-1]
					flag = flag + 1
				end
			end
			if i < 22 && j > 0
				if $tablero[i+1][j-1]
					flag = flag + 1
				end
			end
			if i > 0
				if $tablero[i-1][j]
					flag = flag + 1
				end	
			end
			if i < 22
				if $tablero[i+1][j]
					flag = flag + 1
				end
			end
			if i > 0 && j < 79
				if $tablero[i-1][j+1]
					flag = flag + 1
				end
			end
			if j < 79
				if $tablero[i][j+1]
					flag = flag + 1
				end
			end
			if i < 22 && j < 79
				if $tablero[i+1][j+1]
					flag = flag + 1
				end
			end

			if flag==2 || flag==3 
				$tablero[i][j] = 1
			else
				$tablero[i][j] = 0
			end

			if ($tablero[i][j] == 0) && flag == 3
				$tablero[i][j] = 1
			end

		end
	end
end

## => Imprimiendo el $tablero
def printTablero
	system "clear"
	for i in 0..22
		for j in 0..79
			if $tablero[i][j] == 1
				print "*"	
			else
				print "#"
			end
		end
		print "\n"
	end
end

## => Creando las condiciones iniciales
$tablero[10][10] = 1;
$tablero[10][11] = 1;
$tablero[10][12] = 1;

printTablero

sleep(2)
## => Iniciar el juego
while 1 do 
	execGame
	printTablero
	sleep(0.5)
end