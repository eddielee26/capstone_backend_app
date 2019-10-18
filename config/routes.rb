Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    get "/users/:id" => "users#show"
    post "/users" => "users#create"
    patch "/users/:id" => "users#update"
    delete "/users/:id" => "users#destroy"

    post "/sessions" => "sessions#create"

    get "/workouts" => "workouts#index"
    get "/workouts/:id" => "workouts#show"
    post "/workouts" => "workouts#create"
    patch "/workouts/:id" => "workouts#update"
    delete "/workouts/:id" => "workouts#destroy"

    get "/exercises" => "exercises#index"
    get "/exercises/:id" => "exercises#show"
    post "/exercises" => "exercises#create"
    patch "/exercises/:id" => "exercises#update"
    delete "/exercises/:id" => "exercises#destroy"
  end
end
