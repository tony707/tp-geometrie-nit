redef class Float
	fun absolue: Float
	do
		var retour = self
		if self < 0.0 then
			retour -= self * 2.0
		end
		return retour
	end
end
