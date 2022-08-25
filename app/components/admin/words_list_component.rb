# frozen_string_literal: true

class Admin::WordsListComponent < ViewComponent::Base
  include SessionsHelper

  def initialize lesson:
    super
    @lesson = lesson
  end

  def table_headers
    headers = [t(".definition"), t(".translation")]
    headers << if current_user.admin?
                 t(".delete")
               else
                 t(".done")
               end
  end

  def table_columns
    columns = %w(definition translation)
    columns << if current_user.admin?
                 "delete"
               else
                 "done"
               end
  end

  def table_data_url
    if current_user.admin?
      admin_lesson_words_path @lesson
    else
      lesson_words_path @lesson
    end
  end
end
