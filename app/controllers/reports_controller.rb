# frozen_string_literal: true

class ReportsController < ApplicationController
  before_action :set_report, only: %i[show edit update destroy]
  before_action :contribute_user?, only: %i[edit update destroy]

  # GET /reports
  def index
    @reports = Report.order(:id).page(params[:page])
  end

  # GET /reports/1
  def show; end

  # GET /reports/new
  def new
    @report = Report.new
  end

  # GET /reports/1/edit
  def edit; end

  # POST /reports
  def create
    permit_params = report_params
    permit_params['user_id'] = current_user.id
    @report = Report.new(permit_params)

    if @report.save
      redirect_to @report, notice: t('controllers.common.notice_create', name: Report.model_name.human)
    else
      render :new
    end
  end

  # PATCH/PUT /reports/1
  def update
    if @report.update(report_params)
      redirect_to @report, notice: t('controllers.common.notice_update', name: Report.model_name.human)
    else
      render :edit
    end
  end

  # DELETE /reports/1
  def destroy
    @report.destroy
    redirect_to reports_url, notice: t('controllers.common.notice_destroy', name: Report.model_name.human)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_report
    @report = Report.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def report_params
    params.require(:report).permit(:title, :description)
  end

  def contribute_user?
    return if current_user == @comment.user

    redirect_to reports_path
    flash[:notice] = t('controllers.common.notice_denyed')
  end
end
