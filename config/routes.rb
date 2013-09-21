Timetracker::Application.routes.draw do
  root 'welcome#index'
  resources :accounts
end
