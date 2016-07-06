require 'rspec'
require 'page-object'
require 'require_all'

require_rel 'pages'

World(PageObject::PageFactory)
