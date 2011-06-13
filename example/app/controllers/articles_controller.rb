class ArticlesController < ApplicationController
  
  def index
    @articles = Article.paginate(:per_page => 10, :page => params[:page])
    if request.xhr?
      render :partial => @articles
    end
  end
end