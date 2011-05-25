class Task < ActiveRecord::Base
  belongs_to :project
  belongs_to :feature
  belongs_to :user
  before_save :update_estimates

  def to_s
    name
  end

  private

  def update_estimates
    self.current_estimate = self.original_estimate unless self.current_estimate
    self.elapsed ||= 0
    self.remain = self.current_estimate - self.elapsed
  end
end
