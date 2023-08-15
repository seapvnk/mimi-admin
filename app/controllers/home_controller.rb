class HomeController < ApplicationController
    def index
        @worlds_count = World.where(id: World.group(:signature).maximum(:id).values).count
        @timelines_count = Timeline.count
    end
end
