class Wrangler < ActiveRecord::Base

	validates :name, presence: true
	validates :age, presence: true

	belongs_to :preserve
	has_and_belongs_to_many :gorillas

end
