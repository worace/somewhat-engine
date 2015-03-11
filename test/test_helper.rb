require 'simplecov'
SimpleCov.start
require 'minitest'
require 'minitest/pride'
require 'minitest/autorun'

require_relative '../lib/sales_engine'

require_relative '../lib/merchant_repository'
require_relative '../lib/merchant_parser'
require_relative '../lib/merchant'

require_relative '../lib/customer_repository'
require_relative '../lib/customer_parser'
require_relative '../lib/customer'

require_relative '../lib/invoice_repository'
require_relative '../lib/invoice_parser'
require_relative '../lib/invoice'

require_relative '../lib/item_repository'
require_relative '../lib/item_parser'
require_relative '../lib/item'

require_relative '../lib/invoice_item_repository'
require_relative '../lib/invoice_item_parser'
require_relative '../lib/invoice_item'

require_relative '../lib/transaction_repository'
require_relative '../lib/transaction_parser'
require_relative '../lib/transaction'

require 'bigdecimal/util'
require 'bigdecimal'
require 'date'
require 'csv'
