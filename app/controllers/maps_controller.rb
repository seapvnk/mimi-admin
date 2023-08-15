class MapsController < ApplicationController
  before_action :set_map, only: %i[ show edit update destroy ]
  before_action :set_world, only: %i[ show create edit new update index ]

  # GET /maps or /maps.json
  def index
    @maps = Map.where(id: Map.group(:signature).maximum(:id).values)
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
    @map = Map.new(map_params)
    @map.set_signature

    respond_to do |format|
      if @map.save
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
    map = Map.new(map_params.except(:background, :foreground, :collision_mask))
    map.set_signature(@map.signature)
    
    @map = map

    if map_params[:background].present?
      @map.background.attach(map_params[:background])
    end

    if map_params[:foreground].present?
      @map.foreground.attach(map_params[:foreground])
    end

    if map_params[:collision_mask].present?
      @map.collision_mask.attach(map_params[:collision_mask])
    end

    respond_to do |format|
      if @map.update(map_params)
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
      format.html { redirect_to worlds_maps_url(@world), notice: "Map was successfully destroyed." }
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
