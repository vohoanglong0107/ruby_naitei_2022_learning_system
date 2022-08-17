module LessonsHelper
  def check_index index
    if index > Settings.admin.lesson.number_8
      index + 1
    else
      "0#{index + 1}"
    end
  end
end
