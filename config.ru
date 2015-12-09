#\ -s puma
require File.expand_path('../lib/api.rb', __FILE__)

use Rack::Static, :urls => ["/js", "/partials"], :root => "public", index: "index.html"

run Cookbook::API
