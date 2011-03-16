import polygone

# Classe Fabrique
class Fabrique

	fun creerPolygone(sommets: Array[Point]):Polygone
	do
		# Si c'est un triangle
		if sommets.length == 3 then
			return new Triangle(sommets)

		# Si c'est au moins un quadrilatere
		else if sommets.length == 4 then
			var cote1 = new Segment([sommets[0], sommets[1]])
			var cote2 = new Segment([sommets[1], sommets[2]])
			var cote3 = new Segment([sommets[2], sommets[3]])
			var cote4 = new Segment([sommets[3], sommets[0]])
			var diagonale1 = new Segment([sommets[0], sommets[2]])
			var diagonale2 = new Segment([sommets[1], sommets[3]])

			# Si les cotes sont egaux deux a deux
			if 	cote1.taille == cote3.taille and cote2.taille == cote4.taille then

				# Si les 4 cotes sont egaux
				if cote1.taille == cote2.taille then

					# Si les diagonales sont egales, c'est un carre
					if diagonale1.taille == diagonale2.taille then
						return new Carre(sommets)
					# Sinon un losange
					else
						return new Losange(sommets)
					end

				# Sinon si les diagonales sont egales, c'est un rectangle
				else if diagonale1.taille == diagonale2.taille then
					return new Rectangle(sommets)
				# Sinon c'est un parallelogramme
				else
					return new Parallelogramme(sommets)
				end

			# Sinon c'est un quadrilatere
			else
				return new Quadrilatere(sommets)
			end

			# Sinon on cree un polygone de base
		else
			return new Polygone(sommets)
		end
	end

end
