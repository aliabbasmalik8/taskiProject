class Task < ApplicationRecord
  #include ActionView::Helpers

  belongs_to :project

  after_save :update_percent_completed if :mark_completed?

  mount_uploader :task_file, TaskFileUploader

  def mark_completed?
    self.complted==true
  end

  scope :completed, -> {where(complted: true)}

  
  def update_percent_completed
    project = Project.find(self.project_id)
    count_of_completed_taks=project.tasks.completed.count
    count_of_total_tasks=project.tasks.count
    project.update(percent_complete: Counter.calculate_percent_complete(count_of_completed_taks,count_of_total_tasks))
  end
end
