require_dependency "think_feel_do_dashboard/application_controller"

module ThinkFeelDoDashboard
  class CoachAssignmentsController < ApplicationController
    before_action :set_participant
    before_action :set_coaches
    before_action :set_coach_assignment, only: [:show, :edit, :update, :destroy]

    # GET /think_feel_do_dashboard/participants/1/coaches/new
    def new
      @coach_assignment = @participant.build_coach_assignment
    end

    # POST /think_feel_do_dashboard/participants/1/coaches
    def create
      @coach_assignment = @participant.build_coach_assignment(
        coach_assignment_params
      )

      if @coach_assignment.save
        redirect_to participant_coach_path(@participant, @coach_assignment.coach),
                    notice: "Coach was successfully assigned."
      else
        render :new
      end
    end

    # GET /think_feel_do_dashboard/participants/1/coaches/1
    def show
    end

    # GET /think_feel_do_dashboard/participants/1/coaches/1/edit
    def edit
    end

    # PATCH/PUT /think_feel_do_dashboard/participants/1/coaches/1
    def update
      if @coach_assignment.update(coach_assignment_params)
        redirect_to participant_coach_path(@participant, @coach_assignment.coach),
                    notice: "New coach was assigned."
      else
        render :edit
      end
    end

    # DELETE /think_feel_do_dashboard/participants/1/coaches/1
    def destroy
      if @coach_assignment.destroy
        redirect_to participant_path(@participant),
                    notice: "Coach was successfully removed."
      else
        redirect_to participant_path(@participant),
                    alert: "There were errors."
      end
    end

    private

    def set_coaches
      @coaches = User.all.map { |user| [user.name, user.id] }
    end

    def set_participant
      @participant = Participant.find(params[:participant_id])
    end


    def set_coach_assignment
      @coach_assignment = CoachAssignment.where(
        participant_id: @participant.id,
        coach_id: params[:id]
      ).first
    end

    def coach_assignment_params
      params
        .require(:coach_assignment)
        .permit(:coach_id)
    end
  end
end
