class Preserve < ActiveRecord::Base
	validates :name, presence: true
	validates :location, presence: true

	has_many :gorillas
	has_many :wranglers

  def reassign_all_gorillas_and_wranglers(new_preserve)
     gorillas.each do |g|
       g.update_attributes(preserve: new_preserve)
     end
 
     wranglers.each do |w|
       w.update_attributes(preserve: new_preserve)
     end
 
     true
   end

   def gorillas_fighting?(gorillas)
    count = 0
    gorillas.each do |g|
      if g.anger_level > 1
        count += 1
      end
    end
    count > 1
  end

end 