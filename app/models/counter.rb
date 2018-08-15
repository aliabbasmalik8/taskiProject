class Counter
    def self.calculate_percent_complete(complete_task,total_task)
        complete_task.to_f/total_task.to_f * 100
    end
end