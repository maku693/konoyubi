class ParticipantsController < ApplicationController
  expose :event, find_by: :slug, id: :event_slug
  expose :participants, from: :event

  # POST /events/one/participant
  def create
    if participants.create(participant_params)
      redirect_to event, notice: 'Participation registered'
    else
      byebug
      render 'events/show'
    end
  end

  # DELETE /events/one/participant/1
  def destroy
    participant.destroy
    redirect_to event, notice: 'Participation canceled'
  end

  private
    def participant_params
      params.require(:participant).permit(:event_id, :name)
    end
end
