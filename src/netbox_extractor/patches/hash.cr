class Hash
  # Returns `self` as `AnyHash::JSON`.
  def to_any_h
    NetboxExtractor::RecursiveHash.new(self)
  end
end
