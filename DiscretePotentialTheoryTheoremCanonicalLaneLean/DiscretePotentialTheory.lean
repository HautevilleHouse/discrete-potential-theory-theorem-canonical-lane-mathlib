import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscretePotentialTheoryTheoremCanonicalLaneLean

structure DiscretePotentialTheoryPackage where
  graph : Type u
  boundary : Set graph
  laplacian : (graph → ℝ) → (graph → ℝ)
  kernelDefined : Prop
  harmonicClosure : Prop
  discretePotentialBasis : Prop

structure DiscretePotentialTheoryEvidence (D : DiscretePotentialTheoryPackage) where
  laplacianBounded : D.laplacian = (fun f x => f x - (1 / (degree x)) * ∑ y ∈ neighbors x, f y)
  kernelDefinedClosed : D.kernelDefined
  harmonicClosureClosed : D.harmonicClosure
  discretePotentialBasisClosed : D.discretePotentialBasis

def DiscretePotentialTheoryClosed (D : DiscretePotentialTheoryPackage) : Prop :=
  D.kernelDefined ∧ D.harmonicClosure ∧ D.discretePotentialBasis

theorem discrete_potential_theory_closed_from_evidence
    (D : DiscretePotentialTheoryPackage) (E : DiscretePotentialTheoryEvidence D) :
    DiscretePotentialTheoryClosed D := by
  exact And.intro E.kernelDefinedClosed (And.intro E.harmonicClosureClosed E.discretePotentialBasisClosed)

end DiscretePotentialTheoryTheoremCanonicalLaneLean
end HautevilleHouse
