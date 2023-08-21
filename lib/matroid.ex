defprotocol Matroid do
  # membership query functions
  def ground_set(matroid)
  def base?(matroid, set)
  def independent?(matroid, set)
  # def dependent?(matroid, set)
  # def spanning?(matroid, set)
  # def nonspanning?(matroid, set)
  def circuit?(matroid, set)
  # def hyperplane?(matroid, set)

  # axiom translation functions
  def base_sets(matroid)
  def independent_sets(matroid)
  def dependent_sets(matroid)
  # def spanning_sets(matroid)
  # def nonspanning_sets(matroid)
  def circuit_sets(matroid)
  # def hyperplane_sets(matroid)
end
