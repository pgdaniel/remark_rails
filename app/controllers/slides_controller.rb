class SlidesController < ApplicationController
  layout 'remark'

  def index
    @markdowns = Markdown.all
  end

  def show
    @markdown = Markdown.find(params[:id])
  end
end
