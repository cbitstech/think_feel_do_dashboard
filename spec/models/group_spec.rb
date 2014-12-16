require "spec_helper"

describe Group do
  fixtures :all

  describe "creation of moderator" do

    context "Social Arms" do
      let(:social_arm) { arms(:arm1) }
      let(:clinician2) { users(:user2) }
      let(:group) { social_arm.groups.create!(title: "Group with moderator", moderator_id: clinician2.id) }

      it "creates a moderating participant" do
        moderating_participant = group.moderating_participant
        moderating_participant.reload

        expect(moderating_participant).to_not be_nil
        expect(moderating_participant.is_admin).to eq true
        expect(moderating_participant.display_name).to eq "ThinkFeelDo"
        expect(moderating_participant.email).to_not be_nil
      end

      it "validates whether a moderating participant exists for groups of social arms" do
        moderating_participant = group.moderating_participant
        moderating_participant.update_attributes(is_admin: false)
        moderating_participant.reload

        expect(moderating_participant).to_not be_nil
        expect(moderating_participant.is_admin).to eq true
        expect(moderating_participant.errors.full_messages.include?("at least one moderator needs to exist.")).to eq true
      end
    end

    context "Non-Social Arms" do
      let(:non_social_arm) { arms(:arm2) }
      let(:clinician2) { users(:user2) }
      let(:non_social_group) { Group.create!(arm_id: non_social_arm.id, title: "Group without moderator", moderator_id: clinician2.id) }

      it "doesn't assign a moderating participant upon creation for non-social arms" do
        expect(non_social_group.moderating_participant).to be_nil
      end

      it "doesn't allow a moderating participant to become a member of a group in a non-social arm" do
        membership = non_social_group.memberships.create(
          participant_id: participants(:moderator_for_group1).id,
          start_date: Date.today,
          end_date: Date.today.advance(weeks: 8)
        )

        expect(membership.errors.full_messages.include?("moderators can't be part of this group.")).to eq true
      end
    end
  end
end