class Gorilla < ActiveRecord::Base

	validates :name, presence: true
	validates :age, presence: true

	belongs_to :preserve

end