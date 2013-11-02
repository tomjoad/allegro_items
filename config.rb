require "yaml"
require "lib/custom_helpers"
require "lib/config_methods"

helpers CustomHelpers
# include ConfigMethods

# page "/index.html", :layout => "layout"
# page "/item.html", :layout => "layout"
page "/items/*", :layout => "layout"
page "/*", :layout => "layout"

# Proxy pages (http://middlemanapp.com/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

data.items.each do |category, elements|
  elements.each do |element|
    proxy ConfigMethods.item_url_string(category, element), "/items/item_layout.html",
    :ignore => true,
    :locals => {
      :name => element["name"],
      :description => element["description"],
      :category => element["category"],
      :photo => element["photo"],
      :condition => element["condition"],
      :quantity => element["quantity"]
    }
  end
end

# Reload the browser automatically whenever files change

activate :livereload

set :css_dir, 'css'
set :js_dir, 'js'
set :images_dir, 'img'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end
