module ApplicationHelper
  def bootstrap_flash_class(flash_type)
    { success: 'alert-success',
      error:   'alert-danger',
      alert:   'alert-warning',
      notice:  'alert-info'
    }[flash_type.to_sym] || flash_type.to_s
  end

  def current_user
    UserDecorator.decorate(super) unless super.nil?
  end

  def active_class(link_path)
    current_page?(link_path) ? "active" : ""
  end

  def trim_float(num)
    if num.blank?
      ""
    else
      i, f = num.to_i, num.to_f
      i == f ? i : f
    end
  end

  def change_period_to_comma(number)
    trim_float(number).to_s.gsub('.', ',') unless number.nil?
  end

  def change_blank_to_dash(value)
    value.blank? ? '-' : value
  end
end
