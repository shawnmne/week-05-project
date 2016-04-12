require_relative "../test_helper.rb"

class PreserveTest < Minitest::Test

	def test_valid_at_creation
		p = Preserve.new(name: "Muddy Pond", location: "East Section")
		assert(p.valid? "Should be valid at creation")
	end
end

