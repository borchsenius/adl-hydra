# app/controllers/journal_articles_controller.rb
class JournalArticlesController < ApplicationController



  def new
    @journal_article = JournalArticle.new
  end

  def edit
    @journal_article = JournalArticle.find(params[:id])
  end

  def show
    @journal_article = JournalArticle.find(params[:id])
  end

  def update
    @journal_article = JournalArticle.find(params[:id])
    @journal_article.update_attributes(params[:journal_article])
    redirect_to :edit
  end

end