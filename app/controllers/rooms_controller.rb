class RoomsController < ApplicationController

  def show
    @messages = Message.all
  end

end
# TODO: paginate/limit messages show
