import factory

print ""
#Création de 4 points
var p3 = new Point(0.0, 5.0)
var p4 = new Point(5.0, 5.0)
var p5 = new Point(5.0, 0.0)
var p6 = new Point(0.0, 0.0)

#Création de deux points
print "Obtenir un point à partir de ses coordonnées cartésiennes."
print "Point 1"
var p1 = new Point(0.0, 20.0) #Création de  P1 de coordonées cartésiennes x:0.0 y:20.0
print p1 #On affiche P1
var p2 = new Point(0.5, -10.0) #Création de P2 de coordonées cartésiennes x:0.5 y:20.0
print p2 #On affiche P2

print ""
print ""

#Création d'un segment
var s = new Segment([p1, p2])

#Création des polygones Carré, Losange, Rectangle
print "Obtenir un polygone à partir de la liste de ses sommets."
var ca = new Carre([p3, p4, p5, p6])
print "Carré"
print ca #On affiche ca
print ""
var lo = new Losange([p3, p6, p5, p4])
print "Losange"
print lo #On affiche lo
print ""
var rec = new Rectangle([p3, p4, p5, p6])
print "Rectangle"
print rec #On affiche rec

print ""
print ""


#Création d'un cercle
print "Obtenir un cercle à partir d’un centre et d’un rayon."
print "Cercle"
var c = new Cercle(p1, 5.0)
print c

print ""
print ""

#Calcul de l'aire et du périmètre des figures
print "Calculer l’aire et le périmètre d’une figure."
print "Aire d'un carré  {ca.aire}"
print "Périmètre d'un carré  {ca.perimetre}"
print ""
print "Aire d'un losange  {lo.aire}"
print "Périmètre d'un losange  {lo.perimetre}"
print ""
print "Aire d'un rectangle  {rec.aire}"
print "Périmètre d'un rectangle {rec.perimetre}"
print ""
print "Aire d'un cercle  {c.aire}"
print "Périmètre d'un cercle {c.perimetre}"
print ""
print "Aire d'un point  {p2.aire}"
print "Périmètre d'un point  {p2.perimetre}"

print ""
print ""


#Obtention de l'abscisse et de l'ordonnée d'un point
print "Obtenir l’abscisse et l’ordonnée d’un point."
print "Abscisse"
print p2.x
print "Ordonnée"
print p2.y

print ""
print ""

#Obtention des sommets d'un polygone
print "Obtenir les sommets d’un polygone."
print "Sommets d'un carré  {ca.sommets}"
print "Sommets d'un losange  {s.sommets}"
print "Sommets d'un rectangle  {rec.sommets}"

print ""
print ""

#Obtention du centre et du rayon d'un cercle
print "Obtenir le centre et le rayon d’un cercle."
print "Centre d'un cercle  {c.centre}"
print "Rayon d'un cercle  {c.rayon}"

print ""
print ""

#Obtention de la taille de la longueur, de la largeur et de la diagonale d'un rectangle
print "Obtenir la taille de la longueur, de la largeur et de la diagonale d’un rectangle."
print "Longeur d'un rectangle  {rec.cotes[0].taille}"
print "Largeur d'un rectangle  {rec.cotes[1].taille}"
print "Diagonale d'un rectangle {rec.diagonales[0].taille}"

print ""
print ""

#Obtention de la taille du côté,  de deux diagonales d'un losange
print "Obtenir la taille du coté et des deux diagonales d’un losange."
print "Taille du coté d'un losange  {lo.cotes[0].taille}"
print "Taille de la première diagonale d'un losange  {lo.cotes[0].taille}"
print "Taille de la deuxième diagonales d'un losange  {lo.cotes[1].taille}"

print ""
print ""

print "Obtenir le cercle circonscrit d’un rectangle (cercle passant par les quatre sommets)."
print "Cercle circonscrit  {rec.cercleCirconscrit}"

print ""
print ""

print "Obtenir le cercle inscrit d’un losange (cercle tangent aux quatre cotés)."
print "Cercle inscrit  {lo.cercleInscrit}"

print ""
print ""

print "Obtenir le rectangle inscrit dans un cercle étant donnés deux sommets adjacents situés sur le cercle."
print "Rectangle inscrit d'un rectangle  {lo.rectangleInscrit}"

print ""
print ""

print "Obtenir le rectangle inscrit d’un losange et le losange inscrit d’un rectangle."
print "Rectangle inscrit d'un losange  {lo.rectangleInscrit}"
print "Losange inscrit d'un rectangle  {rec.losangeInscrit}"

print ""
print ""

print "Savoir si deux figures sont géométriquement les mêmes."
print "Losange et Rectangle identiques ?: {lo == rec}"

print ""
print ""

var fabrique = new Fabrique
print "Utilisation de la classe Fabrique"
print "Construction d'un polygone avec 4 points: {fabrique.creerPolygone([p3, p4, p5, p6])}"

