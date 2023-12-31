class TimelinesController < ApplicationController
  before_action :set_timeline, only: %i[ show edit update destroy ]
  before_action :set_timelines, only: %i[ index edit new create ]

  # GET /timelines or /timelines.json
  def index
  end

  # GET /timelines/1 or /timelines/1.json
  def show
  end

  # GET /timelines/new
  def new
    @timeline = Timeline.new
  end

  # GET /timelines/edit
  def edit
  end

  # POST /timelines or /timelines.json
  def create
    @timeline = Timeline.new(timeline_params)
    branch_timeline if @timeline.parent_id.present?

    respond_to do |format|
      if @timeline.save
        format.html { redirect_to timelines_path, notice: "Timeline was successfully created." }
        format.json { render :show, status: :created, location: @timeline }
      else
        format.html { render :index, status: :unprocessable_entity }
        format.json { render json: @timeline.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_timeline
      @timeline = Timeline.find(params[:id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_timelines
      @timelines = Timeline.all
    end

    # Clone elements from timelines
    def branch_timeline
      parent = Timeline.find(@timeline.parent_id)
      
      branch = parent.branch
      branch.start_date = @timeline.start_date
      @timeline = branch
    end

    # Only allow a list of trusted parameters through.
    def timeline_params
      params.require(:timeline).permit(:parent_id, :start_date)
    end
end
