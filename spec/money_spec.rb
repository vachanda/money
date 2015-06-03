require 'spec_helper'
	
describe Money do 
	it "having initialization inputs as 10Rs, 200p the equivalent value in rupees should be 12" do
		m = Money.new(10,200)
		expect(m.in_rupees).to eq(12)
	end

	it "having initialization inputs as 2Rs, 20p the equivalent value in paisas should be 220" do
		m = Money.new(2,20)
		expect(m.in_paisas).to eq(220)
	end
end