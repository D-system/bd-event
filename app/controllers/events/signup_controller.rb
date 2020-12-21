class Events::SignupController < ApplicationController
  before_action :set_event, only: [:create, :destroy]

  def create
    signup = Signup.new(event: @event, email: signup_params)

    if signup.save
      head :ok
    else
      render json: signup.errors, status: :unprocessable_entity
    end
  rescue ActiveRecord::RecordNotUnique
    render json: I18n.t("signup_email_already_exists"), status: :unprocessable_entity
  end

  def destroy
    signup = @event.signups.find_by!(email: signup_params)

    if signup.destroy
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
    @event = Event.find_by!(uid: params[:event_uid])
  end
end
