module EnrollmentDashboard
  class Project < ActiveRecord::Base
    has_many :arms
  end
end
