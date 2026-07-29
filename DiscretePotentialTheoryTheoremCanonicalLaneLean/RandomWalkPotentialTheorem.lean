import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DiscretePotentialTheoryCanonicalLaneLean.HarmonicFunctionClosure
import HautevilleHouse.DiscretePotentialTheoryCanonicalLaneLean.EffectiveResistanceBridge

namespace HautevilleHouse
namespace DiscretePotentialTheoryCanonicalLaneLean

structure RandomWalkPackage {H : HarmonicFunctionPackage} (hClosed : HarmonicFunctionClosed H) where
  transitionMatrix : H.graph → H.graph → ℝ
  stationaryDistribution : H.graph → ℝ
  reversibility : ∀ x y, transitionMatrix x y * stationaryDistribution x = transitionMatrix y x * stationaryDistribution y
  harmonicViaLaplacian : ∀ f, H.harmonicCondition f ↔ (∀ x, f x = ∑ y, transitionMatrix x y * f y)

structure RandomWalkEvidence {H : HarmonicFunctionPackage} {hClosed : HarmonicFunctionClosed H} (W : RandomWalkPackage hClosed) where
  reversibilityClosed : ∀ x y, W.transitionMatrix x y * W.stationaryDistribution x = W.transitionMatrix y x * W.stationaryDistribution y
  harmonicViaLaplacianClosed : ∀ f, H.harmonicCondition f ↔ (∀ x, f x = ∑ y, W.transitionMatrix x y * f y)

def RandomWalkPotentialClosed {H : HarmonicFunctionPackage} {hClosed : HarmonicFunctionClosed H} (W : RandomWalkPackage hClosed) : Prop :=
  (∀ x y, W.transitionMatrix x y * W.stationaryDistribution x = W.transitionMatrix y x * W.stationaryDistribution y) ∧
  (∀ f, H.harmonicCondition f ↔ (∀ x, f x = ∑ y, W.transitionMatrix x y * f y))

theorem random_walk_potential_closed_from_evidence {H : HarmonicFunctionPackage} {hClosed : HarmonicFunctionClosed H}
  (W : RandomWalkPackage hClosed) (E : RandomWalkEvidence W) :
  RandomWalkPotentialClosed W := by
  exact And.intro E.reversibilityClosed E.harmonicViaLaplacianClosed

end DiscretePotentialTheoryCanonicalLaneLean
end HautevilleHouse