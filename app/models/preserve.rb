class Preserve < ActiveRecord::Base
	validates :name, presence: true
	validates :location, presence: true

	has_many :gorillas
	has_many :wranglers
#reassign_all_gorillas_and_wranglers method updates the preserve to a new
#    preserve for all the gorillas and wranglers currently assigned to a 
#    preserve that is being destroyed
#
#new_preserve - integer: the id preserve id that is being switched over to
#
#returns true
  def reassign_all_gorillas_and_wranglers(new_preserve)
     gorillas.each do |g|
       g.update_attributes(preserve: new_preserve)
     end
 
     wranglers.each do |w|
       w.update_attributes(preserve: new_preserve)
     end
 
     true
   end

#gorillas_fighting? method checks to see if there is more than 1 gorilla 
#    ready to fight
#
#gorillas - array: contains all the gorilla objects at the preserve
#
#returns either true or false
   def gorillas_fighting?(gorillas)
    count = 0
    gorillas.each do |g|
      if g.anger_level > 1
        count += 1
      end
    end
    count > 1
  end

#gorillas_hungry? method checks to see if there is a hungry gorilla 
#    ready to to take off from a preserve
#
#gorillas - array: contains all the gorilla objects at the preserve
#
#returns either true or false
   def gorillas_hungry?(gorillas, preserve)
    count = 0
    gorillas.each do |g|
      if g.hunger_level > 1 && g.preserve_id == preserve.id
        g.update_attributes(preserve_id: nil)
        count += 1
      else 
        count
      end
    end
    count > 0
  end
  #gorillas_get_fed method feeds all gorillas by 
#    lowering there hunger_level by 1
#
#gorillas - array: contains all the gorilla objects at the preserve
#
#
  def gorillas_get_fed(gorillas, preserve)
    gorillas.each do |g|
      if g.preserve_id == preserve.id
        g.hunger_level = g.hunger_level - 1
        if g.hunger_level < 1
          g.hunger_level = 0
        else
          g.hunger_level
        end
        g.update_attributes(hunger_level: g.hunger_level)
      end
    end
    true
  end


#gorillas_go_hungry method feeds all gorillas by 
#    raising there hunger_level by 1
#
#gorillas - array: contains all the gorilla objects at the preserve
#
#
  def gorillas_go_hungry(gorillas, preserve)
    gorillas.each do |g|
      if g.preserve_id == preserve.id
        g.hunger_level = g.hunger_level + 1
        if g.hunger_level > 1
          g.hunger_level = 2
        else
          g.hunger_level
        end
        g.update_attributes(hunger_level: g.hunger_level)
      end
    end
    true
  end

end