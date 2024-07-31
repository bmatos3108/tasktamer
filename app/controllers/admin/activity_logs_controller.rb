class Admin::ActivityLogsController < ApplicationController
  def index
    @activity_logs = ActivityLog.all
  end

  def show
    @activity_log = ActivityLog.find(params[:id])
  end
end
