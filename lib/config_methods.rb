module ConfigMethods
  extend self

  def item_url_string(category, item)
    "/#{category}/#{item["name"].gsub(/\s/, '_').squeeze("_")}.html"
  end

end
