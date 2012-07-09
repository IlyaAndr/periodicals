# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Periodicals::Application.initialize!

Time::DATE_FORMATS[:date_format] = "%Y.%m.%d"

WillPaginate.per_page = 8

Haml::Template.options[:escape_html] = true
Haml::Template.options[:escape_attrs] = true

Paperclip.options[:command_path] = "/usr/bin/"
