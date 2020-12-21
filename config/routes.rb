Rails.application.routes.draw do
  scope '/events' do
    get '/' => 'events#index', as: 'events'
  end
end
