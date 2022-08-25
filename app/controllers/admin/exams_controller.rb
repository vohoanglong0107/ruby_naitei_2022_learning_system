class Admin::ExamsController < Admin::BaseController
  include ExamsHelper

  before_action :load_exam, only: :show
  def index
    @exams = Exam.all
  end

  def show; end

  def load_exam
    @exam = Exam.find_by id: params[:id]
    return if @exam.present?

    flash[:error] = t "exams.not_found"
    redirect_to exams_path
  end
end
