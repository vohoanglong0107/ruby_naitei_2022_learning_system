module ApplicationHelper
  def full_title page_title = ""
    base_title = t "helper.title"
    page_title.blank? ? base_title : "#{page_title} | #{base_title}"
  end

  def toastr_flash type
    case type
    when "error"
      "toastr.error"
    when "success"
      "toastr.success"
    else
      "toastr.info"
    end
  end
end
