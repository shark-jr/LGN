# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      # see_user = find_verified_user
      # logger.add_tags 'ActionCable', see_user.email
      # self.current_user = see_user
      self.current_user = find_verified_user
      logger.add_tags 'ActionCable', current_user.email
    end

    protected
    def find_verified_user
      if (current_user = User.find_by_id cookies.signed['user.id'])
        current_user
      else
        reject_unauthorized_connection
      end
    end

  end
end
