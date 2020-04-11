class Run < ActiveRecord::Base
    belongs_to :user

    def avg_speed 
        (self.distance / self.duration.to_f)*60 
    end
end
