#Defines attributes related to money in indian currency
class Money
	def initialize(rupee, paisa)
		@paisas = paisa % 100
		@rupees = rupee + (paisa / 100)
	end

	def in_rupees
		@rupees + (@paisas/100)
	end

end