# There are two projects - an adolescent and an adult
# These projects have many arms to each one with between
# Between 1 and 8 groups are in each arm.
module ThinkFeelDoDashboard
  class ArmGroupJoin < ActiveRecord::Base
    belongs_to :arm
    belongs_to :group

    validates :arm, :group, presence: true
  end
end