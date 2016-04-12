require_relative "../test_helper.rb"

class GorillaTest < Minitest::Test
	def test_valid_at_creation
		g = Gorilla.new(name: "Henry", age: 24)
		assert(g.valid? "should be valid at creation")
	end
end