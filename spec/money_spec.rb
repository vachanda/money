require 'spec_helper'
	
describe Money do 
	context "equality" do
		it "having values as 3Rs, 30p should be equal to other object having values 3Rs, 30p" do
			m1 = Money.new(3,30)
			m2 = Money.new(3,30)
			expect(m1).to eq(m2)
		end

		it "having values as 3Rs, 30p should be equal to other object having values 3Rs, 30p" do
			m1 = Money.new(3,30)
			m2 = Money.new(3,30)
			expect(m1.eql?(m2)).to eq(true)
		end

		it "having values as 3Rs, 30p should not be equal to other object having values 4Rs, 30p" do
			m1 = Money.new(3,30)
			m2 = Money.new(4,30)
			expect(m1).to_not eq(m2)
		end

		it "having values as 3Rs, 30p should be equal to other object having values 2Rs, 130p" do
			m1 = Money.new(3,30)
			m2 = Money.new(2,130)
			expect(m1).to eq(m2)
		end

		it "having values as 3Rs, 30p should not be equal to other object having values 4Rs, 430p" do
			m1 = Money.new(3,30)
			m2 = Money.new(4,430)
			expect(m1).to_not eq(m2)
		end	

		it "having values as 2Rs, 76p should have the same hash as another object with values 2Rs, 76p" do
			m1 = Money.new(2,76)
			m2 = Money.new(2,76)
			expect(m1.hash).to eq(m2.hash)
		end

		it "having values as 2Rs, 76p should not have the same hash as another object with values 2Rs, 75p" do
			m1 = Money.new(2,76)
			m2 = Money.new(2,75)
			expect(m1.hash).to_not eq(m2.hash)
		end
	end

	context "Addition" do
		it "having values as 5Rs, 40p when added with another object having 8Rs, 30p the equivalent sum should be 13Rs, 70p" do
			m1 = Money.new(5,40)
			m2 = Money.new(8,30)
			m3 = Money.new(13,70)
			expect(m1+m2).to eq(m3)
		end

		it "having values as 1Rs, 40p when added with another object having 8Rs, 30p the equivalent sum should be 13Rs, 70p" do
			m1 = Money.new(1,40)
			m2 = Money.new(8,30)
			m3 = Money.new(9,70)
			expect(m1+m2).to eq(m3)
		end
	end
	
	context "Subtraction" do
		it "having values as 5Rs, 30p when subtracted with another object having 2Rs, 30p the equivalent difference should be 3Rs" do
			m1 = Money.new(5, 30)
			m2 = Money.new(2, 30)
			m3 = Money.new(3, 0)
			expect(m1-m2).to eq(m3)
		end

		it "having values as 5Rs, 30p when subtracted with another object having 5Rs, 30p the equivalent difference should be 0Rs" do
			m1 = Money.new(5, 30)
			m2 = Money.new(5, 30)
			m3 = Money.new(0, 0)
			expect(m1-m2).to eq(m3)
		end

		it "having values as 5Rs, 40p when subtracted with another object having 8Rs, 40p the equivalent difference should be -3Rs" do
			m1 = Money.new(2, 0)
			m2 = Money.new(0, 90)
			m3 = Money.new(1, 10)
			expect(m1-m2).to eq(m3)
		end
	end

	context "Value in string" do
		it "having value 0Rs, 0p is Rupee 0" do
		m1 = Money.new(0, 0)
		expect(m1.value_in_string).to eq("Rupees 0")
		end

		it "having value 0Rs, 80p is Paisa 80" do
		m1 = Money.new(0, 80)
		expect(m1.value_in_string).to eq("Paisa 80")
		end

		it "having value 1Rs, 0p is Rupee 1" do
		m1 = Money.new(1, 80)
		expect(m1.value_in_string).to eq("Rupees 1 and Paisa 80")
		end

		it "having value - 1Rs, 80p is Rupee 1" do
		m1 = Money.new(-0, -80)
		expect(m1.value_in_string).to eq("Minus Rupees 0 and Paisa 80")
		end

	end
end