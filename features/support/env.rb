require 'rspec'
require 'page-object'
require 'require_all'
require 'data_magic'
require_rel 'pages'
require 'factory_girl'

World(PageObject::PageFactory)
World(FactoryGirl::Syntax::Methods)
