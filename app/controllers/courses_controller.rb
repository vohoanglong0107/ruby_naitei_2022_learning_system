class CoursesController < BaseController
  include Pagy::Backend

  def index
    @pagy, @courses = pagy Course.recommended
  end

  def show
    @course = Course.find_by id: params[:id]
    return if @course.present?

    flash[:danger] = t ".no_course"
    redirect_to root_path
  end
end
