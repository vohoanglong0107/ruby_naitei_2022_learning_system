class CoursesController < ApplicationController
  include Pagy::Backend

  def index
    @pagy, @courses = pagy Course.recommended
  end
end
