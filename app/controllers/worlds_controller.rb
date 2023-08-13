class WorldsController < ApplicationController
  before_action :set_world, only: %i[ show edit update destroy ]
  before_action :set_timelines, only: %i[ new edit ] 

  # GET /worlds or /worlds.json
  def index
    @worlds = World.all
  end

  # GET /worlds/1 or /worlds/1.json
  def show
  end

  # GET /worlds/new
  def new
    @world = World.new
  end

  # GET /worlds/1/edit
  def edit
  end

  # POST /worlds or /worlds.json
  def create
    @world = World.new(world_params)

    if @world.save
      respond_to do |format|
        format.html { redirect_to world_url(@world), notice: "World was successfully created." }
        format.json { render :show, status: :created, location: @world }
      end
    else
      respond_to do |format|
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @world.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /worlds/1 or /worlds/1.json
  def update
    respond_to do |format|
      if @world.update(world_params)
        format.html { redirect_to world_url(@world), notice: "World was successfully updated." }
        format.json { render :show, status: :ok, location: @world }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @world.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /worlds/1 or /worlds/1.json
  def destroy
    @world.destroy

    respond_to do |format|
      format.html { redirect_to worlds_url, notice: "World was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_world
      @world = World.find(params[:id])
    end

    def set_timelines
      @timelines = Timeline.all
    end

    # Only allow a list of trusted parameters through.
    def world_params
      params.require(:world).permit(:name, :description, :timeline_id)
    end
end
