module ApplicationHelper

  def humanize_term(term)
    term =~ /^\d+$/ ? pluralize(term.to_i, 'year') : term.titleize
  end

  def as_json(object)
    object.to_json.html_safe
  end

end
