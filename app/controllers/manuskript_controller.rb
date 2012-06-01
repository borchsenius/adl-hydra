class ManuskriptController < ApplicationController
  # app/controllers/journal_articles_controller.rb
    def new
      @manuskript = Manuskript.new
    end

end