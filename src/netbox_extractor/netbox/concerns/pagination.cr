module NetboxExtractor
  module Netbox
    # Paginated loading of a Netbox list endpoint.
    module Pagination
      # Repeatedly invokes the block with `(limit, offset)`, accumulating the rows
      # of every page into a fresh `klass` collection.
      #
      # The offset advances by the number of rows **actually returned**, not by the
      # requested `limit`: Netbox caps page size server-side (`MAX_PAGE_SIZE`), so a
      # `limit` above that cap would otherwise make the offset overshoot and silently
      # skip whole blocks of objects (C7). Loading stops when a page comes back empty
      # (guards against an infinite loop when the API keeps reporting `_next` on an
      # empty page, L1) or when the page reports no further `_next`.
      #
      # Any exception raised by the block propagates unchanged: a transient load
      # failure must surface as an error, never as a silently-empty result (C1).
      def self.load(klass : T.class, limit : Int32, & : Int32, Int32 -> _) forall T
        results = T.new
        offset = 0

        loop do
          page = yield limit, offset
          results.concat(page.results)
          offset += page.results.size
          break if page.results.empty? || page._next.nil?
        end

        results
      end
    end
  end
end
