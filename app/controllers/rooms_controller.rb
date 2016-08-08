class RoomsController < ApplicationController
  def show

    # TODO: paginate/limit messages show
    @messages = Message.all
  end
end
