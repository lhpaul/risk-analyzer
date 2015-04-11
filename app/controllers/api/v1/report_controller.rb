class Api::V1::ReportController < Api::V1::BaseController
  before_filter :authenticate_user!
  respond_to :json

  def index
    response = []
    reports = current_user.reports
    reports.each do |report| ## Esto se puede optimizar en una query en vez de una query por cada reporte
      response << report.to_json
    end
    respond_with(response)
  end

  def show
    report = Report.find(params[:id])
    respond_with(report.to_json)
  end

  def get_subjects
    report = Report.find(params[:id])
    @data = []
    report.subjects.each do |subject|
      @data << subject.to_json
    end
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
    @report = Report.new(:name => report_params[:name])
    @report.add_subjects(report_params[:ruts])
    @report.user_id = current_user.id;
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
