defprotocol Matroid do
  def includes?(matroid, set)
  def ground_set(matroid)
end
