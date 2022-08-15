class CoursesController < BaseController
  include Pagy::Backend

  def index
    @pagy, @courses = pagy Course.recommended
  end
end
