Rails.application.routes.draw do
  root to: 'search#new'
  post '/' => 'search#create'
end
