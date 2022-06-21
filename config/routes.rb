Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  scope '/api' do
    resources :statuses
    resources :tasks
    resources :users
    resources :task_groups
    resources :projects
    resources :updates
    get 'tasks/:id/updates', :to => 'tasks#get_updates'
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
