require 'simplecov'
SimpleCov.start
require 'minitest'
require 'minitest/pride'
require 'minitest/autorun'

require './lib/sales_engine'

require './lib/merchants'
require './lib/merchants_parser'
require './lib/merchants_repository'

require './lib/customers'
require './lib/customers_parser'
require './lib/customers_repository'

require './lib/items'
require './lib/items_parser'
require './lib/items_repository'

require './lib/invoices'
require './lib/invoices_parser'
require './lib/invoices_repository'