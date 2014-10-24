module ThinkFeelDoDashboard
  # Used in the participant 'show' page to create dynamic routes
  module ParticipantsHelper
    def current_coach_link(participant)
      if participant.coach
        text = "Current Coach: #{participant.coach.email}"
        href = participant_coach_path(participant, participant.coach)
      else
        text = "Assign Coach"
        href = new_participant_coach_path(participant)
      end
      link_to text, href, class: "list-group-item"
    end

    def current_group_link(participant)
      if participant.active_membership && participant.active_membership.group
        text = "Current Group: #{participant.active_group.title}"
        href = participant_group_path(participant, participant.active_group)
      else
        text = "Assign Group"
        href = new_participant_group_path(participant)
      end
      link_to text, href, class: "list-group-item"
    end
  end
end