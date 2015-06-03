#Defines attributes related to money in indian currency
class Money
	attr_reader :paisa
	def initialize(rupee, paisa)
		@paisa = paisa + rupee * 100
	end

	def +(other_object)
		Money.new(0, @paisa + other_object.paisa) if other_object && self.class == other_object.class
	end

	def -(other_object)
		Money.new(0, @paisa - other_object.paisa) if other_object && self.class == other_object.class
	end
	
	def ==(other_object)
		(@paisa == other_object.paisa) if other_object && other_object.class == self.class
	end

	def value_in_string
		"Rupees "+(@paisa / 100).to_s if @paisa % 100 == 0
		"Paisa "+@paisa.to_s if @paisa < 100
	end

	def hash
		[@paisa].hash
	end

	def eql?(other_object)
		self == other_object
	end

end