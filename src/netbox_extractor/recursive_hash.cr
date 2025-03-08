module NetboxExtractor
  # Define possible value types for our own AnyHash class (RecursiveHash)
  alias ValuesType = Nil |
                     Bool |
                     Int32 |
                     Int64 |
                     Float32 |
                     Float64 |
                     String |
                     Time |
                     Array(ValuesType)

  # Define our own AnyHash class (RecursiveHash)
  # RecursiveHash
  AnyHash.define_new klass: :RecursiveHash,
    key: String,
    value: ValuesType
end
