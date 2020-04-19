class Run < ActiveRecord::Base
    belongs_to :user

    validates :date, presence: true
    validates :duration, presence: true, numericality: true
    validates :distance, presence: true, numericality: {greater_than: 0}
    validates :pace, presence: true

    def avg_speed_in_mph
        (((self.distance / self.duration.to_f)*60)*60).round(2) 
    end

    def avg_speed 
        (self.distance / self.duration.to_f)
    end

    def display_time(duration)
        Time.at(duration).utc.strftime("%H:%M:%S")
    end
    
    def display_date
        Time.at(self.date).strftime('%m/%d/%Y')
    end 

    def mile_time 
        display_time(1/avg_speed)
    end 

    def fivek_time
        display_time(3.1/avg_speed)
    end 

    def half_marathon_time
        display_time(13.11/avg_speed)
    end  

    def marathon_time
        display_time(26.22/avg_speed)
    end

end
