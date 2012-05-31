# app/controllers/journal_articles_controller.rb
class JournalArticlesController < ApplicationController
  def new
    @journal_article = JournalArticle.new
  end
end