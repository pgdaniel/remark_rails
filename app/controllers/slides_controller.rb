class SlidesController < ApplicationController
  layout 'remark', only: [:show, :edit]

  def index
    @markdowns = Markdown.all
  end

  def show
    markdown
  end

  def edit
    markdown
  end

  def update
    if markdown.update(content: params[:markdown][:content])
      redirect_to slide_path(markdown)
    else
      render :edit
    end
  end

  private

  def markdown
    @markdown = Markdown.find(params[:id])
  end
end
