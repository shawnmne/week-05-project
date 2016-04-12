require_relative "../test_helper.rb"

class WranglerTest < Minitest::Test

	def test_valid_at_creation
		w = Wrangler.new(name: "Steve Austin", age: 62)
		assert(w.valid? "Should be valid at creation")
	end
end