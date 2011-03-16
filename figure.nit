import utils

# Classe abstraite Figure
interface Figure
	# Definit la methode aire pour chaque sous-classe de Figure
	fun aire: Float is abstract
	# Definit la methode perimetre pour chaque sous-classe de Figure
	fun perimetre: Float is abstract
end

# Classe Point
class Point
	super Figure
	# Coordonnee x de la classe Point. Attribut non mutable.
	readable var _x: Float

	# Coordonnee y de la classe Point. Attribut non mutable.
	readable var _y: Float

	# Construit un Point a l'aide des valeurs des coordonnees x et y.
	init (x: Float, y: Float)
	do
		self._x = x
		self._y = y
	end

	# Calcule l'aire d'un Point.
	redef fun aire: Float
	do
		return 0.0
	end

	# Calcule le perimetre d'un Point.
	redef fun perimetre: Float
	do
		return 0.0
	end

	# Permet de comparer un objet Point avec un objet de la bibliotheque
	redef fun ==(f)
	do
		return f isa Point and self.x == f.x and self.y == f.y
	end

	# Permet de formater l'affichage de l'objet Point
	redef fun to_s
	do
		return "Point -> x: {x}, y: {y}"
	end
end

#	Classe Segment
class Segment
	super Figure

	# Coordonnees des sommets d'un segment. Definit par deux Points.
	readable var _sommets: Array[Point]

	# Construit un Segment a laide des valeurs de deux sommets. Une mauvaise utilisation leve une exeption.
	init (sommets: Array[Point])
	do
		assert sommets.length == 2 else
			print "Un segment doit se composer de deux points."
		end
		assert sommets[0] != sommets[1] else
			print "Les deux points d'un segment doivent être distincts."
		end
		self._sommets = sommets
	end

	# Calcule l'aire dun Segment
	redef fun aire: Float
	do
		return 0.0
	end

	# Calcule le perimetre d'un Segment
	redef fun perimetre: Float
	do
		return self.taille
	end

	# Permmet de comparer un objet Segment avec un objet de la bibliothèque
	redef fun ==(f)
	do
		return f isa Segment and f.as(Segment).sommets == self.sommets
	end

	# Calcule la taille d'un Segment
	fun taille: Float
	do
		var ecart_x = (self.sommets[0].x - self.sommets[1].x).absolue
		var ecart_y = (self.sommets[0].y - self.sommets[1].y).absolue
		return (ecart_x.pow(2.0) + ecart_y.pow(2.0)).sqrt
	end

	# Definit le milieu d'un Segment
	fun milieu: Point
	do
		var milieu_x = (self.sommets[0].x + self.sommets[1].x) / 2.0
		var milieu_y = (self.sommets[0].y + self.sommets[1].y) / 2.0
		return new Point(milieu_x, milieu_y)
	end

	# Permet de formater l'affichage de l'objet Segment
	redef fun to_s
	do
		return "Segment -> [{sommets[0]},{sommets[1]}]"
	end
end

# Classe Cercle
class Cercle
	super Figure

	# Coordonnees du centre du Cercle
	readable var _centre: Point

	# Valeur du rayon du Cercle
	readable var _rayon: Float

	# Construit un cercle a l'aide d'un centre et d'un rayon
	init (centre: Point, rayon: Float)
	do
		self._centre = centre
		self._rayon = rayon
	end

	# Calcule l'aire du Cercle
	redef fun aire: Float
	do
		return pi*self.rayon.pow(2.0)
	end

	# Calcule le perimetre du Cercle
	redef fun perimetre: Float
	do
		return 2.0*pi*self.rayon
	end

	# Permmet de comparer un objet Cercle avec un objet de la bibliothèque
	redef fun ==(f)
	do
		return f isa Cercle and f.as(Cercle).centre == self.centre and f.as(Cercle).rayon == self.rayon
	end

	# Permet de formater l'affichage de l'objet Cercle
	redef fun to_s
	do
		return "Cercle -> rayon: {rayon}, centre: [{centre}]"
	end

end

