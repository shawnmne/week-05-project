class MakeInitialModels < ActiveRecord::Migration
	create_table :preserves do |t|
		t.string :location, null: false
		t.string :name, null: false
	end
	create_table :gorillas do |t|
		t.string :name, null: false
		t.integer :age, null: false
		t.integer :preserve_id
	end
	create_table :wranglers do |t|
		t.string :name, null: false
		t.integer :age, null: false
		t.integer :preserve_id
	end
end
