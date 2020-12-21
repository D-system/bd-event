class Events::SignupController < ApplicationController
  before_action :set_event, only: :create

  def create
    signup = Signup.new(event: @event, email: signup_params)

    if signup.save
      head :ok
    else
      render json: signup.errors, status: :unprocessable_entity
    end
  end

  private

  def signup_params
    params.require(:email)
  end

  def set_event
    @event = Event.find_by(uid: params[:event_uid])
  end
end
