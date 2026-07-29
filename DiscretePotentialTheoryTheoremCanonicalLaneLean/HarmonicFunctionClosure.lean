import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscretePotentialTheoryCanonicalLaneLean

structure HarmonicFunctionPackage where
  graph : Type u
  vertexSet : Set graph
  edgeRelation : graph → graph → Prop
  laplacian : (graph → ℝ) → (graph → ℝ)
  harmonicCondition : (graph → ℝ) → Prop
  boundary : Set graph
  dirichletProblemWellPosed : Prop

structure HarmonicFunctionEvidence (H : HarmonicFunctionPackage) where
  laplacianLinear : H.laplacian (λ _ => 0) = λ _ => 0
  harmonicConditionConsistent : ∀ f, H.harmonicCondition f ↔ H.laplacian f = λ _ => 0
  dirichletProblemWellPosedClosed : H.dirichletProblemWellPosed

def HarmonicFunctionClosed (H : HarmonicFunctionPackage) : Prop :=
  H.harmonicCondition (λ _ => 0) ∧ H.dirichletProblemWellPosed

theorem harmonic_function_closed_from_evidence (H : HarmonicFunctionPackage) (E : HarmonicFunctionEvidence H) :
    HarmonicFunctionClosed H := by
  constructor
  · apply E.laplacianLinear
  · exact E.dirichletProblemWellPosedClosed

end DiscretePotentialTheoryCanonicalLaneLean
end HautevilleHouse