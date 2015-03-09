# require './lib/merchant_repository'
# require './lib/merchant_parser'

# require './lib/customer_repository'
# require './lib/customer_parser'

# require './lib/invoice_repository'
# require './lib/invoice_parser'

# require './lib/item_repository'
# require './lib/item_parser'

# require './lib/invoice_item_repository'
# require './lib/invoice_item_parser'

# require './lib/transaction_repository'
# require './lib/transaction_parser'

  require_relative './merchant_repository'
  require_relative './merchant_parser'

  require_relative './customer_repository'
  require_relative './customer_parser'

  require_relative './invoice_repository'
  require_relative './invoice_parser'

  require_relative './item_repository'
  require_relative './item_parser'

  require_relative './invoice_item_repository'
  require_relative './invoice_item_parser'

  require_relative './transaction_repository'
  require_relative './transaction_parser'

require 'bigdecimal'
require 'bigdecimal/util'
