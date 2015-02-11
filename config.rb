require "extensions/views"

activate :views
activate :directory_indexes

configure :development do
  activate :livereload
end

set :css_dir,    'assets/stylesheets'
set :js_dir,     'assets/javascripts'
set :images_dir, 'assets/images'
set :fonts_dir,  'assets/fonts'
set :layout,     'layouts/application'
set :relative_links, true

page "blog/*", layout: :article

# GA
activate :google_analytics do |ga|
  ga.tracking_id = 'UA-714749-17'
  ga.development = false
end

# XML sitemap
set :url_root, 'http://blog.yafoy.com'
activate :search_engine_sitemap, default_priority: 1,
                                 default_change_frequency: "daily"

# Build-specific configuration
configure :build do
  require "favicon_maker"
  activate :favicon_maker

  # Relative assets needed to deploy to Github Pages
  activate :relative_assets

  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"

  ignore "/shared/_project.html"
  ignore "/styleguide.html"
end


activate :deploy do |deploy|
  deploy.build_before = true
  deploy.method = :git
end


# Blog settings
# ------------------------------------------------------------------------------

# Time.zone = "UTC"

activate :blog do |blog|
  # This will add a prefix to all links, template references and source paths
  blog.prefix = "blog"

  blog.permalink = ":year/:month/:title"

  # blog.permalink = "{year}/{month}/{day}/{title}.html"
  # Matcher for blog source files
  # blog.sources = "{year}-{month}-{day}-{title}.html"
  # blog.taglink = "tags/{tag}.html"
  # blog.layout = "layouts/article"
  # blog.summary_separator = /(READMORE)/
  # blog.summary_length = 250
  # blog.year_link = "{year}.html"
  # blog.month_link = "{year}/{month}.html"
  # blog.day_link = "{year}/{month}/{day}.html"
  # blog.default_extension = ".markdown"
  # blog.new_article_template = 'source/layouts/article.erb'

  blog.tag_template = "tag.html"
  blog.calendar_template = "calendar.html"

  # Enable pagination
  # blog.paginate = true
  # blog.per_page = 10
  # blog.page_link = "page/{num}"
end

page "/feed.xml", layout: false

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", layout: false
#
# With alternative layout
# page "/path/to/file.html", layout: :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
# activate :livereload

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end
