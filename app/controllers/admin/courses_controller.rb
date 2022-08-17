class Admin::CoursesController < Admin::BaseController
  include Pagy::Backend
  before_action :guard_admin

  def index
    @pagy, @courses = pagy Course.recommended
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new course_params
    @course.order = Course.all.length + 1
    if @course.save
      flash[:success] = t ".course_create_success"
    else
      flash[:error] = t ".course_create_fail"
    end
    redirect_to admin_root_path
  end

  private

  def course_params
    params.require(:course).permit :name, :description
  end
end
