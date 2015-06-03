require 'spec_helper'
	
describe Money do 
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


	it "having values as 5Rs, 40p when added with another object having 8Rs, 30p the equivalent sum should be 13Rs, 70p" do
		m1 = Money.new(5,40)
		m2 = Money.new(8,30)
		sum = m1 + m2
		expect(sum.value).to eq("Rupees 13, Paise 70")
	end


end