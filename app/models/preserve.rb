class Preserve < ActiveRecord::Base
	validates :name, presence: true
	validates :location, presence: true

	has_many :gorillas
	has_many :books

end 