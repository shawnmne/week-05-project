class MakeInitialModels < ActiveRecord::Migration
	create_table :preserve do |t|
		t.string :location, null: false
	end
	create_table :gorilla do |t|
		t.string :name, null: false
		t.integer :age, null: false
		t.integer :preserve_id
	end
	create_table :wrangler do |t|
		t.string :name, null: false
		t.integer :age, null: false
		t.integer :preserve_id
	end
end
