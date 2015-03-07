require 'simplecov'
SimpleCov.start
require 'minitest'
require 'minitest/pride'
require 'minitest/autorun'

require './lib/sales_engine'

require './lib/merchant'
require './lib/merchant_parser'
require './lib/merchant_repository'

require './lib/customer'
require './lib/customer_parser'
require './lib/customer_repository'

require './lib/item'
require './lib/item_parser'
require './lib/item_repository'

require './lib/invoice'
require './lib/invoice_parser'
require './lib/invoice_repository'