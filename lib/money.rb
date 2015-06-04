#Defines attributes related to money in indian currency
class Money
	attr_reader :paisa
	def initialize(rupee, paisa)
		@paisa = paisa + rupee * 100
		raise NegativeMoneyException, "Money can't be negative" if @paisa < 0
	end

	def +(other_object)
		Money.new(0, @paisa + other_object.paisa) if other_object && self.class == other_object.class
	end

	def -(other_object)
		raise TypeError if !other_object || self.class != other_object.class
		raise NegativeMoneyException, "Money can't be negative" if @paisa - other_object.paisa < 0 
		Money.new(0, @paisa - other_object.paisa) if other_object && self.class == other_object.class
	end
	
	def ==(other_object)
		(@paisa == other_object.paisa) if other_object && other_object.class == self.class
	end

	def to_s
		str = ""
		temp_paisa = @paisa.abs % 100
		temp_rupees = @paisa.abs / 100
		if temp_rupees > 0
			str += "Rupees #{temp_rupees} "
		end
		if temp_paisa > 0
			str += "Paisa #{temp_paisa}"
		end
		str.strip
	end

	def hash
		[@paisa].hash
	end

	def eql?(other_object)
		self == other_object
	end
end