class AddHungerLevelToGorillas < ActiveRecord::Migration
	def change
		add_column :gorillas, :hunger_level, :integer, :default => 0
	end
end