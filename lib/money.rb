#Defines attributes related to money in indian currency
class Money
	attr_reader :rupees, :paise
	def initialize(rupee, paisa)
		@paise = paisa % 100
		@rupees = rupee + (paisa / 100)
	end

	def in_rupees
		@rupees + (@paise/100)
	end

	def in_paisas
		(@rupees * 100) + @paise
	end

	def value
		"Rupees #{@rupees}, Paise #{@paise}"
	end

	def +(other_object)
		Money.new((@rupees + other_object.rupees), (@paise + other_object.paise)) if other_object && self.class == other_object.class
	end

	def -(other_object)
		paise_result = (@rupees * 100 + @paise) - (other_object.rupees * 100 + other_object.paise)
		Money.new(paise_result / 100 , paise_result % 100)
	end
	
	def ==(other_object)
		(@rupees == other_object.rupees && @paise == other_object.paise) if other_object && other_object.class == self.class
	end

	def hash
		[@rupees,@paise].hash
	end

	def eql?(other_object)
		self == other_object
	end

end