class AddAngerLevelToGorillas < ActiveRecord::Migration
	def change
		add_column :gorillas, :anger_level, :integer, :default => 0
	end
end