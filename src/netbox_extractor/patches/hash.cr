class Hash
  # Returns `self` as `AnyHash::JSON`.
  def to_any_h
    NetboxClient::RecursiveHash.new(self)
  end
end
