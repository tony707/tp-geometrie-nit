import figure

# Classe Polygone
class Polygone
	super Figure

	# Coordonnee d'un Polygone sous forme d'une liste de point.
	readable var _sommets: Array[Point]

	# Construit un Polygone a l'aide de Point qui composeront ses sommets
	init (sommets: Array[Point])
	do
		for sommet in sommets
		do
			assert sommets.count(sommet) == 1 else
				print "Tous les sommets du polygone doivent etre distincts."
			end
		end
		assert sommets.length >= 3 else
			print "Un polygone doit avoir 3 sommets minimum"
		end
		self._sommets = sommets
	end

	# Retourne l'ensemble des cotes d'un Polygone
	fun cotes: Array[Segment]
	do
		var cotes = new Array[Segment]
		var len = self.sommets.length

		if len > 0 then
			var i = 0
			while i < len-1
			do
				cotes.push(new Segment([self.sommets[i], self.sommets[i+1]]))
				i += 1
			end
			cotes.push(new Segment([self.sommets[len-1], self.sommets[0]]))
		end

		return cotes
	end

	# Il est tres difficile de calculer l'aire d'un polygone de part sa complexite.
	# On considere l'aire egale a 0 jusqu'a ce qu'il soit possible de la calculer
	redef fun aire
	do
		return 0.0
	end

	# Permet de calculer le perimetre d'un Polygone
	redef fun perimetre: Float
	do
		var perimetre = 0.0

		for segment in self.cotes
		do
			perimetre += segment.taille
		end

		return perimetre
	end

	# Permmet de comparer un objet Polygone avec un objet de la bibliotheque
	redef fun ==(f)
	do
		if not f isa Polygone then return false
		for sommet in self.sommets
		do
			if not f.as(Polygone).sommets.has(sommet) then return false
		end
		return true
	end

	# Permet de formater l'affichage de l'objet Polygone
	redef fun to_s
	do
		return "Polygone -> [{sommets}]"
	end
end

# Classe Triangle
class Triangle
	super Polygone

	# Construit un triangle a l'aide de ses trois sommets. Une mauvaise construction leve une exeption.
	init (sommets: Array[Point])
	do
		super(sommets)
		assert sommets.length == 3 else
			print "Un triangle doit avoir 3 sommets et non {sommets.length}"
		end
	end

	# Calcule de l'aire d'un triangle, a l'aide de la formule du Heron.
	redef fun aire
	do
		var s = self.perimetre / 2.0
		return (s*(s-self.cotes[0].taille)*(s-self.cotes[1].taille)*(s-self.cotes[2].taille)).sqrt
	end

	# Permet de comaparer un objet Triangle avec un objet de la bibliotheque
	redef fun ==(f)
	do
		return super(f) and f isa Triangle
	end

	# Permet de formater l'affichage de l'objet Triangle
	redef fun to_s
	do
		return "Triangle -> " + super
	end

end

# Classe Quadrilatere
class Quadrilatere
	super Polygone

	# Construit un Quadrilatere a l'aide des valeurs de ses quatre sommets. Une mauvaise construction leve une exeption.
	init (sommets: Array[Point])
	do
		super(sommets)
		assert sommets.length == 4 else
			print "Un quadrilatere doit avoir 4 sommets et non {sommets.length}"
		end
	end

	# Definit les diagonales d'un Quadrilatere
	fun diagonales: Array[Segment]
	do
		var diagonales = new Array[Segment]
		diagonales.push(new Segment([self.sommets[0], self.sommets[2]]))
		diagonales.push(new Segment([self.sommets[1], self.sommets[3]]))

		return diagonales
	end

	# Permet de comparer un objet Quadrilatere avec un objet de la bibliotheque
	redef fun ==(f)
	do
		return super(f) and f isa Quadrilatere
	end

	# Permet de formater l'affichage de l'objet Quadrilatere
	redef fun to_s
	do
		return "Quadrilatere -> " + super
	end

end

# Classe Parallelogramme
class Parallelogramme
	super Quadrilatere

	init (sommets: Array[Point])
	do
		super(sommets)
		assert self.cotes[0].taille == self.cotes[2].taille and self.cotes[1].taille == self.cotes[3].taille else
			print " Les cotes d'un parallelogramme doivent etre egaux deux a deux."
		end
	end

	redef fun aire: Float
	do
		return (new Triangle([self.sommets[0], self.sommets[1], self.sommets[2]])).aire * 2.0
	end

	redef fun ==(f)
	do
		return super(f) and f isa Parallelogramme
	end

	# Permet de formater l'affichage de l'objet Parallelogramme
	redef fun to_s
	do
		return "Parallelogramme -> " + super
	end

end

# Classe Losange
class Losange
	super Parallelogramme

	# Construit un Losange a l'aide des valeurs de ses quatres sommets. Une mauvaise utilisation leve une exeption.
	init (sommets: Array[Point])
	do
		super(sommets)
		assert self.cotes[0].taille == self.cotes[1].taille else
			print "Les 4 cotes d'un losanges doivent etre egaux."
		end
	end

	# Definit le Rectangle inscrit d'un Losange
	fun rectangleInscrit: Rectangle
	do
		return new Rectangle([self.cotes[0].milieu, self.cotes[1].milieu, self.cotes[2].milieu, self.cotes[3].milieu])
	end

	# Definit le Cercle inscrit d'un Losange
	fun cercleInscrit: Cercle
	do
		return self.rectangleInscrit().cercleCirconscrit()
	end

	# Calcule l'aire d'un Cercle
	redef fun aire: Float
	do
		return (self.diagonales[0].taille * self.diagonales[1].taille) / 2.0
	end

	# Permet de comparer un objet Losange avec objet de la bibliotheque.
	redef fun ==(f)
	do
		return super(f) and f isa Losange
	end

	# Permet de formater l'affichage de l'objet Losange
	redef fun to_s
	do
		return "Losange -> " + super
	end

end

# Classe Rectangle
class Rectangle
	super Parallelogramme

	# Construit un Rectangle a l'aide de ses quatres sommets.
	init (sommets: Array[Point])
	do
		super(sommets)
		assert self.diagonales[0].taille == self.diagonales[1].taille else
			print "Les diagonales d'un rectangle doivent etre egales."
		end
	end

	# Definit le Cercle circonscrit d'un Rectangle
	fun cercleCirconscrit: Cercle
	do
		var centre = self.diagonales[0].milieu
		var rayon = self.diagonales[0].taille / 2.0
		return new Cercle(centre, rayon)
	end

	# Definit le Losange inscrit d'un Rectangle
	fun losangeInscrit: Losange
	do
		return new Losange([self.cotes[0].milieu, self.cotes[1].milieu, self.cotes[2].milieu, self.cotes[3].milieu])
	end

	# Calcule l'aire d'un Rectangle
	redef fun aire: Float
	do
		return self.cotes[0].taille * self.cotes[1].taille
	end

	# Permet de comparer un objet Rectangle avec un objet de la bibliotheque
	redef fun ==(f)
	do
		return super(f) and f isa Rectangle
	end

	# Permet de formater l'affichage de l'objet Rectangle
	redef fun to_s
	do
		return "Rectangle -> " + super
	end

end

# Classe Carre
class Carre
	super Losange
	super Rectangle

	# Construit un Carre a l'aide de ses quatres Sommmets. Une mauvaise utilisation leve une exeption
	init (sommets: Array[Point])
	do
	end

	# Permet de comparer un Objet Carre avec un objet de la bibliotheque
	redef fun ==(f)
	do
		return super(f) and f isa Carre
	end

	# Calcule l'aire d'un carre
	redef fun aire: Float
	do
		return self.cotes[0].taille.pow(2.0)
	end

	# Permet de formater l'affichage de l'objet Rectangle
	redef fun to_s
	do
		return "Carre -> " + super
	end

end
