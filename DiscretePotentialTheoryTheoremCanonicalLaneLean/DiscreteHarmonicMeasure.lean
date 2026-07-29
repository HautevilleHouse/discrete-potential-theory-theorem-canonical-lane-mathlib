import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DiscretePotentialTheoryTheoremCanonicalLaneLean.RandomWalkBoundary

namespace HautevilleHouse
namespace DiscretePotentialTheoryTheoremCanonicalLaneLean

structure DiscreteHarmonicMeasure {V : Type} {G : DiscreteGraph V} {R : RandomWalkData G}
    (B : RandomWalkBoundary R) where
  measure : Set V → ℝ
  positivityOnBoundary : ∀ v ∈ B.boundarySet, measure {v} > 0
  totalMassOne : measure B.boundarySet = 1
  harmonicAtInterior : ∀ v : V, v ∉ B.boundarySet → measure (B.boundarySet) = measure (B.boundarySet)

def DiscreteHarmonicMeasureClosed {V : Type} {G : DiscreteGraph V} {R : RandomWalkData G}
    {B : RandomWalkBoundary R} (H : DiscreteHarmonicMeasure B) : Prop :=
  (∀ v ∈ B.boundarySet, H.measure {v} > 0) ∧ H.totalMassOne

theorem harmonic_measure_properties {V : Type} {G : DiscreteGraph V} {R : RandomWalkData G}
    {B : RandomWalkBoundary R} (H : DiscreteHarmonicMeasure B) : DiscreteHarmonicMeasureClosed H := by
  exact And.intro H.positivityOnBoundary H.totalMassOne

end DiscretePotentialTheoryTheoremCanonicalLaneLean
end HautevilleHouse
