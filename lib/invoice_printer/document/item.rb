require 'invoice_printer/document'

module InvoicePrinter
  class Document
    # Line items for InvoicePrinter::Document
    #
    # Example:
    #
    #  item = InvoicePrinter::Document::Item.new(
    #    name: 'UX consultation',
    #    quantity: '4',
    #    unit: 'hours',
    #    price: '$ 25',
    #    tax: '$ 5'
    #    amount: '$ 120'
    #  )
    #
    # +amount+ should equal the +quantity+ times +price+,
    # but this is not enforced.
    class Item
      attr_reader :name,
                  :quantity,
                  :unit,
                  :price,
                  :tax,
                  :tax2,
                  :tax3,
                  :amount

      class << self
        def from_json(json)
          new(
            name:     String(json['name']),
            quantity: String(json['quantity']),
            unit:     String(json['unit']),
            price:    String(json['price']),
            tax:      String(json['tax']),
            tax2:     String(json['tax2']),
            tax3:     String(json['tax3']),
            amount:   String(json['amount'])
          )
        end
      end

      def initialize(name:     nil,
                     quantity: nil,
                     unit:     nil,
                     price:    nil,
                     tax:      nil,
                     tax2:     nil,
                     tax3:     nil,
                     amount:   nil)

        @name     = String(name)
        @quantity = String(quantity)
        @unit     = String(unit)
        @price    = String(price)
        @tax      = String(tax)
        @tax2     = String(tax2)
        @tax3     = String(tax3)
        @amount   = String(amount)
      end

      def to_h
        {
          'name':     @name,
          'quantity': @quantity,
          'unit':     @unit,
          'price':    @price,
          'tax':      @tax,
          'tax2':     @tax2,
          'tax3':     @tax3,
          'amount':   @amount,
        }
      end

      def to_json
        to_h.to_json
      end
    end
  end
end
