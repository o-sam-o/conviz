module ApplicationHelper

  def humanize_term(term)
    term =~ /^\d+$/ ? pluralize(term.to_i, 'year') : term.titleize
  end

end
