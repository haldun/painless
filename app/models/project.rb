class Project < ActiveRecord::Base
  belongs_to :user
  has_many :features, :dependent => :destroy
  has_many :tasks, :dependent => :destroy, :order => "created_at desc"

  def to_s
    name
  end

  def to_param
    "#{id}-#{name.parameterize}"
  end
end
