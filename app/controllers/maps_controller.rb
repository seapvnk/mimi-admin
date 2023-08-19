class MapsController < ApplicationController
  before_action :set_map, only: %i[ show edit update destroy ]
  before_action :set_world, only: %i[ show create edit new update index destroy ]

  # GET /maps or /maps.json
  def index
    @maps = Map
      .where(id: Map.with_deleted.group(:signature).maximum(:id).values)
      .where(world_id: @world.id)
      .order(created_at: :desc)
  end

  # GET /maps/1 or /maps/1.json
  def show
  end

  # GET /maps/new
  def new
    @map = Map.new
  end

  # GET /maps/1/edit
  def edit
  end

  # POST /maps or /maps.json
  def create
    @map = MapService.create(map_params)

    respond_to do |format|
      if @map
        format.html { redirect_to world_map_path(@world, @map), notice: "Map was successfully created." }
        format.json { render :show, status: :created, location: @map }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @map.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /maps/1 or /maps/1.json
  def update
    @map = MapService.update(@map, map_params)

    respond_to do |format|
      if @map
        format.html { redirect_to world_map_path(@world, @map), notice: "Map was successfully updated." }
        format.json { render :show, status: :ok, location: @map }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @map.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /maps/1 or /maps/1.json
  def destroy
    @map.destroy

    respond_to do |format|
      format.html { redirect_to world_maps_url(@world), notice: "Map was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_map
      @map = Map.find(params[:id])
    end

    def set_world
      @world = World.find(params[:world_id])
    end

    # Only allow a list of trusted parameters through.
    def map_params
      params.require(:map).permit(:name, :description, :collision_mask, :background, :foreground, :world_id)
    end
end
