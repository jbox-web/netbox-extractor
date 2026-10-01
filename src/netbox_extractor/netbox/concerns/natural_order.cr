module NetboxExtractor
  module Netbox
    # Compares two names the way Netbox orders them. Netbox 4.4 sorts names
    # with the PostgreSQL ICU collation `natural_sort` (`und-u-kn-true`):
    # runs of digits compare by value (`srv2` before `srv10`) and letters
    # regardless of case (`ad-lb01` before `Test`). Used to merge objects of
    # another list into an order Netbox produced, without moving its objects.
    def self.natural_compare(a : String, b : String) : Int32
      chunks_a = a.scan(/\d+|\D+/).map(&.[0])
      chunks_b = b.scan(/\d+|\D+/).map(&.[0])

      chunks_a.zip?(chunks_b) do |chunk_a, chunk_b|
        return 1 unless chunk_b

        order = if chunk_a[0].ascii_number? && chunk_b[0].ascii_number?
                  # By value, without an integer type to overflow: fewer
                  # significant digits is smaller, then digit by digit.
                  digits_a = chunk_a.lstrip('0')
                  digits_b = chunk_b.lstrip('0')
                  {digits_a.size, digits_a} <=> {digits_b.size, digits_b}
                else
                  chunk_a.downcase <=> chunk_b.downcase
                end
        return order unless order.zero?
      end

      chunks_a.size <=> chunks_b.size
    end
  end
end
