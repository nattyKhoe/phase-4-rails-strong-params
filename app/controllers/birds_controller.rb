class BirdsController < ApplicationController
  # to disable the wrap parameters as the result of privat emethod of strong params/params permit
  wrap_parameters format: []
  #or to put the in all controllers, by going
  #cofig/initializers/wrap_parameters.rb
  #ActiveSupport.on_load(:action_controller) do 
  #wrap_parameters format: []
  #end

  # GET /birds
  def index
    birds = Bird.all
    render json: birds
  end

  # POST /birds
  def create
    bird = Bird.create(bird_params)
    render json: bird, status: :created
  end

  # GET /birds/:id
  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: bird
    else
      render json: { error: "Bird not found" }, status: :not_found
    end
  end

  private
  def bird_params
    params.permit(:name, :species)
  end

end
