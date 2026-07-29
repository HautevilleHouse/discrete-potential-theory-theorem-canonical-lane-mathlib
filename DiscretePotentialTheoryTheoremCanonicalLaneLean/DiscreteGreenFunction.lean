import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscretePotentialTheoryTheoremCanonicalLaneLean

structure DiscreteGreenFunctionPackage where
  graph : Type u
  vertexSet : Set graph
  edgeSet : Set (graph × graph)
  laplacian : (graph → ℝ) → (graph → ℝ)
  boundary : Set graph
  greenFunction : graph × graph → ℝ
  existence : Prop
  symmetry : Prop
  positivity : Prop
  existenceTerm : existence
  symmetryTerm : symmetry
  positivityTerm : positivity

structure DiscreteGreenFunctionEvidence (G : DiscreteGreenFunctionPackage) where
  existenceClosed : G.existence
  symmetryClosed : G.symmetry
  positivityClosed : G.positivity

def DiscreteGreenFunctionClosed (G : DiscreteGreenFunctionPackage) : Prop :=
  G.existence ∧ G.symmetry ∧ G.positivity

theorem discrete_green_function_closed_from_evidence
    (G : DiscreteGreenFunctionPackage) (E : DiscreteGreenFunctionEvidence G) :
    DiscreteGreenFunctionClosed G := by
  exact And.intro E.existenceClosed (And.intro E.symmetryClosed E.positivityClosed)

end DiscretePotentialTheoryTheoremCanonicalLaneLean
end HautevilleHouse