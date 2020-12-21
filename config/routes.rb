Rails.application.routes.draw do
  scope '/events' do
    get '/' => 'events#index', as: 'events'
    post '/:event_uid/signup' => 'events/signup#create', as: 'events_signup'
    delete '/:event_uid/leave' => 'events/signup#destroy', as: 'events_leave'
  end
end
