class TimelinesController < ApplicationController
  before_action :set_timeline, only: %i[ show edit update destroy ]

  # GET /timelines or /timelines.json
  def index
    @timelines = Timeline.all
  end

  # GET /timelines/1 or /timelines/1.json
  def show
  end

  # GET /timelines/new
  def new
    @timeline = Timeline.new
    @timelines = Timeline.all
  end

  # POST /timelines or /timelines.json
  def create
    @timeline = Timeline.new(timeline_params)

    respond_to do |format|
      if @timeline.save
        format.html { redirect_to timeline_url(@timeline), notice: "Timeline was successfully created." }
        format.json { render :show, status: :created, location: @timeline }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @timeline.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_timeline
      @timeline = Timeline.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def timeline_params
      params.require(:timeline).permit(:parent_id)
    end
end
