class RefreshController < ApplicationController
  def show
    DropboxUpdateJob.perform_now
    redirect_to slides_path
  end
end
