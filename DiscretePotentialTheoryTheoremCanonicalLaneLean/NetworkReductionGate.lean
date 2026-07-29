import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DiscretePotentialTheoryCanonicalLaneLean.EffectiveResistanceBridge

namespace HautevilleHouse
namespace DiscretePotentialTheoryCanonicalLaneLean

structure NetworkReductionPackage {H : HarmonicFunctionPackage} {hClosed : HarmonicFunctionClosed H}
  {G : GreenFunctionPackage hClosed} {R : EffectiveResistancePackage G} where
  parallelLaw : ∀ a b c : H.graph, R.effectiveResistance a c = (1 / (1 / R.effectiveResistance a b + 1 / R.effectiveResistance b c))⁻¹
  seriesLaw : ∀ a b c : H.graph, R.effectiveResistance a c = R.effectiveResistance a b + R.effectiveResistance b c
  starTriangleTransform : ∀ a b c d : H.graph, R.effectiveResistance a d = (R.effectiveResistance a b * R.effectiveResistance a c) / (R.effectiveResistance a b + R.effectiveResistance a c + R.effectiveResistance b c)

structure NetworkReductionEvidence {H : HarmonicFunctionPackage} {hClosed : HarmonicFunctionClosed H}
  {G : GreenFunctionPackage hClosed} {R : EffectiveResistancePackage G}
  (N : NetworkReductionPackage R) where
  parallelLawClosed : ∀ a b c : H.graph, N.parallelLaw a b c
  seriesLawClosed : ∀ a b c : H.graph, N.seriesLaw a b c
  starTriangleTransformClosed : ∀ a b c d : H.graph, N.starTriangleTransform a b c d

def NetworkReductionClosed {H : HarmonicFunctionPackage} {hClosed : HarmonicFunctionClosed H}
  {G : GreenFunctionPackage hClosed} {R : EffectiveResistancePackage G}
  (N : NetworkReductionPackage R) : Prop :=
  (∀ a b c, N.parallelLaw a b c) ∧ (∀ a b c, N.seriesLaw a b c) ∧ (∀ a b c d, N.starTriangleTransform a b c d)

theorem network_reduction_closed_from_evidence {H : HarmonicFunctionPackage} {hClosed : HarmonicFunctionClosed H}
  {G : GreenFunctionPackage hClosed} {R : EffectiveResistancePackage G}
  (N : NetworkReductionPackage R) (E : NetworkReductionEvidence N) :
  NetworkReductionClosed N := by
  exact And.intro E.parallelLawClosed (And.intro E.seriesLawClosed E.starTriangleTransformClosed)

end DiscretePotentialTheoryCanonicalLaneLean
end HautevilleHouse