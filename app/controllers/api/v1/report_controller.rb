class Api::V1::ReportController < Api::V1::BaseController
  before_filter :authenticate_user!
  respond_to :json

  def index
    response = []
    reports = Report.all
    reports.each do |report| ## Esto se puede optimizar en una query en vez de una query por cada reporte
      response << {ready_porcentage: (report.done_jobs/report.subjects.count).to_i }
    end
    respond_with(response)
  end

  def show
    @data = Report.find(params[:id]).to_json()
    respond_with(@data)
  end

  def update 
    @data = Report.find(params[:id])
    respond_to do |format|
      if @data.update_attributes(report_params)
        format.json { head :no_content }
      else
        format.json { render json: @data.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    @report = Report.new
    @report.add_subjects(report_params[:ruts])
    @report.save
    render json: { msj: 'ok'}
  end

  def destroy
    @data = Report.find(params[:id])
    @data.destroy
    respond_to do |format|
      format.json  { head :ok }
    end
  end

  private

  def report_params
    params.require(:report)
  end
end
