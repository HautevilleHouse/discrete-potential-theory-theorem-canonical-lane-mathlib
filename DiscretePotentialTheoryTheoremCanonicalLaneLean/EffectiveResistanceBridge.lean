import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DiscretePotentialTheoryCanonicalLaneLean.HarmonicFunctionClosure
import HautevilleHouse.DiscretePotentialTheoryCanonicalLaneLean.GreenFunctionAdmissible

namespace HautevilleHouse
namespace DiscretePotentialTheoryCanonicalLaneLean

structure EffectiveResistancePackage {H : HarmonicFunctionPackage} {hClosed : HarmonicFunctionClosed H}
  (G : GreenFunctionPackage hClosed) where
  effectiveResistance : H.graph → H.graph → ℝ
  formulaViaGreen : ∀ a b, effectiveResistance a b = G.greenFunction a a + G.greenFunction b b - 2 * G.greenFunction a b
  positivity : ∀ a b, effectiveResistance a b ≥ 0
  symmetry : ∀ a b, effectiveResistance a b = effectiveResistance b a

structure EffectiveResistanceEvidence {H : HarmonicFunctionPackage} {hClosed : HarmonicFunctionClosed H}
  {G : GreenFunctionPackage hClosed} (R : EffectiveResistancePackage G) where
  formulaViaGreenClosed : ∀ a b, R.effectiveResistance a b = G.greenFunction a a + G.greenFunction b b - 2 * G.greenFunction a b
  positivityClosed : ∀ a b, R.effectiveResistance a b ≥ 0

def EffectiveResistanceClosed {H : HarmonicFunctionPackage} {hClosed : HarmonicFunctionClosed H}
  {G : GreenFunctionPackage hClosed} (R : EffectiveResistancePackage G) : Prop :=
  (∀ a b, R.effectiveResistance a b = G.greenFunction a a + G.greenFunction b b - 2 * G.greenFunction a b) ∧
  (∀ a b, R.effectiveResistance a b ≥ 0)

theorem effective_resistance_closed_from_evidence {H : HarmonicFunctionPackage} {hClosed : HarmonicFunctionClosed H}
  {G : GreenFunctionPackage hClosed} (R : EffectiveResistancePackage G) (E : EffectiveResistanceEvidence R) :
  EffectiveResistanceClosed R := by
  exact And.intro E.formulaViaGreenClosed E.positivityClosed

end DiscretePotentialTheoryCanonicalLaneLean
end HautevilleHouse