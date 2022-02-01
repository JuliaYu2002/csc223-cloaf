class BikesController < ApplicationController
    def bikes
        @bikes = Bike.all.order(identifier: :asc)
    end
end
