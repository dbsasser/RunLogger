class Run < ActiveRecord::Base
    belongs_to :user

    def avg_speed_in_mph
        (self.distance / self.duration.to_f)*60 
    end

    def avg_speed 
        (self.distance / self.duration.to_f)/60
    end

    def mile_time 
        time = 1/avg_speed 
        Time.at(time).utc.strftime("%H:%M:%S")
    end 


end
