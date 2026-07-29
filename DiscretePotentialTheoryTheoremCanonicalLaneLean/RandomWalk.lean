import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscretePotentialTheoryTheoremCanonicalLaneLean

structure RandomWalkPackage (G : DiscreteGreenFunctionPackage) where
  transitionMatrix : G.graph → G.graph → ℝ
  stationaryDistribution : G.graph → ℝ
  hittingProbability : G.graph → G.graph → ℝ
  recurrence : Prop
  transience : Prop
  recurrenceTerm : recurrence
  transienceTerm : transience

structure RandomWalkEvidence {G : DiscreteGreenFunctionPackage}
    (R : RandomWalkPackage G) where
  recurrenceClosed : R.recurrence
  transienceClosed : R.transience

def RandomWalkClosed {G : DiscreteGreenFunctionPackage}
    (R : RandomWalkPackage G) : Prop :=
  R.recurrence ∧ R.transience

theorem random_walk_closed_from_evidence
    {G : DiscreteGreenFunctionPackage} (R : RandomWalkPackage G)
    (E : RandomWalkEvidence R) : RandomWalkClosed R := by
  exact And.intro E.recurrenceClosed E.transienceClosed

end DiscretePotentialTheoryTheoremCanonicalLaneLean
end HautevilleHouse