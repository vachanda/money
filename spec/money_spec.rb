require 'spec_helper'
	
describe Money do 
	context "equality" do
		it "having initialization inputs as 10Rs, 200p the equivalent value in rupees should be 12" do
			m = Money.new(10,200)
			expect(m.in_rupees).to eq(12)
		end

		it "having initialization inputs as 2Rs, 20p the equivalent value in paise should be 220" do
			m = Money.new(2,20)
			expect(m.in_paisas).to eq(220)
		end

		it "having initialization inputs as 10Rs, 20p the equivalent value returned should be Rupees 10, Paise 20" do
			m = Money.new(10,20)
			expect(m.value).to eq("Rupees 10, Paise 20")
		end

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

	it "having values as 5Rs, 40p when added with another object having 8Rs, 30p the equivalent sum should be 13Rs, 70p" do
		m1 = Money.new(5,40)
		m2 = Money.new(8,30)
		m3 = Money.new(13,70)
		expect(m1+m2).to eq(m3)
	end
	
	it "having values as 5Rs, 40p when subtracted with another object having 2Rs, 40p the equivalent difference should be 3Rs" do
		m1 = Money.new(5, 30)
		m2 = Money.new(8, 30)
		m3 = Money.new(3, 0)
		expect(m1-m2).to eq(m3)
	end

end