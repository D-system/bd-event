class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def record_not_found
    render json: I18n.t('record_not_found'), status: :unprocessable_entity
  end
end
