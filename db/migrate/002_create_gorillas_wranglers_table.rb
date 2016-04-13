class CreateGorillasWranglersTable < ActiveRecord::Migration
   def change
     create_join_table :gorillas, :wranglers
   end
 end