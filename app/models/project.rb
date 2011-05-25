class Project < ActiveRecord::Base
  belongs_to :user
  has_many :features, :dependent => :destroy
  has_many :tasks, :dependent => :destroy

  def to_s
    name
  end
end
