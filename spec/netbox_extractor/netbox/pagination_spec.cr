require "../../spec_helper"

# Minimal stand-in for a Netbox paginated response page: only the fields the
# paginator reads (`results`, `_next`).
record FakePage(T), results : Array(T), _next : String?

Spectator.describe NetboxExtractor::Netbox::Pagination do
  describe ".load" do
    it "collects every row across pages, advancing offset by rows actually returned" do
      # The server caps page size (100) below the requested limit (250): the
      # offset must advance by the rows actually returned, never by `limit`,
      # otherwise whole blocks of objects are silently skipped (C7).
      all = (1..250).to_a
      requested_limit = 250
      server_page = 100
      seen_offsets = [] of Int32

      result = NetboxExtractor::Netbox::Pagination.load(Array(Int32), requested_limit) do |_limit, offset|
        seen_offsets << offset
        slice = all[offset, server_page]? || [] of Int32
        nxt = (offset + server_page < all.size) ? "next-url" : nil
        FakePage(Int32).new(results: slice, _next: nxt)
      end

      expect(result).to eq(all)
      expect(seen_offsets).to eq([0, 100, 200])
    end

    it "terminates when a page returns no rows even if _next is still set (L1)" do
      calls = 0

      result = NetboxExtractor::Netbox::Pagination.load(Array(Int32), 50) do |_limit, _offset|
        calls += 1
        FakePage(Int32).new(results: [] of Int32, _next: "next-url")
      end

      expect(result).to be_empty
      expect(calls).to eq(1)
    end

    it "propagates a load failure instead of returning a silent empty result (C1)" do
      expect do
        NetboxExtractor::Netbox::Pagination.load(Array(Int32), 50) do |_limit, _offset|
          raise IO::Error.new("connection reset")
        end
      end.to raise_error(IO::Error)
    end
  end
end
