class CoursesController < BaseController
  include Pagy::Backend

  def index
    @search_query = Course.ransack params[:q]
    @pagy, @courses = pagy @search_query.result
  end

  def show
    @course = Course.find_by id: params[:id]
    return if @course.present?

    flash[:danger] = t ".no_course"
    redirect_to root_path
  end
end
