class Run < ActiveRecord::Base
    belongs_to :user

    def avg_speed 
        (self.distance / self.duration.to_f)*60 
    end

    def speed 
        (self.distance / self.duration.to_f)/60
    end

    def mile_time 
        time = 1/speed 
        Time.at(time).utc.strftime("%H:%M:%S")
    end 


end
