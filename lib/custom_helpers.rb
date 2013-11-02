require "lib/config_methods"

module CustomHelpers
  extend ConfigMethods
  # using like: ConfigMethods.method

  def test_helper
    return "shit"
  end

  # def link_to_item(category, item)
  #   name = item["name"].gsub(/\s/, '_').squeeze("_")
  #   return "/#{category}/#{name}.html"
  # end

  def categories
    data.items.keys
  end
end
