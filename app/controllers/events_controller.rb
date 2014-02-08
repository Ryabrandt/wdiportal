class EventsController < ApplicationController

	def index
		@events = Event.all
	end

	def new
		@event = Event.new
	end

	def show
		id = params.require(:id)
		@event = Event.find(id)
	end

	def create
		parameters = params.require(:event).permit(:title, :date, :location, :cost, :description)
		event = Event.create(parameters)
		redirect_to events_path
	end

	def edit
		id = params.require(:id)
		@event = Event.find(id)
	end

	def update
		id = params.require(:id)
		updates = params.require(:event).permit(:title, :date, :location, :cost, :description)
		event = Event.find(id)
		event.update(updates)
		redirect_to events_path
	end

	def destroy
		id = params[:id]
		Event.destroy(id)
		redirect_to events_path
	end

end