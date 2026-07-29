import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DiscretePotentialTheoryTheoremCanonicalLaneLean.DiscreteGreenFunction

namespace HautevilleHouse
namespace DiscretePotentialTheoryTheoremCanonicalLaneLean

structure ConductorResistance {V : Type} (G : DiscreteGraph V) where
  conductance : V → V → ℝ
  symmetricConductance : ∀ u v : V, conductance u v = conductance v u
  effectiveResistance : V → V → ℝ
  definedViaGreen : Prop
  reciprocity : ∀ a b : V, effectiveResistance a b = effectiveResistance b a

def ConductorResistanceClosed {V : Type} {G : DiscreteGraph V} (C : ConductorResistance G) : Prop :=
  (∀ u v : V, C.conductance u v = C.conductance v u) ∧
  C.definedViaGreen ∧ (∀ a b : V, C.effectiveResistance a b = C.effectiveResistance b a)

theorem conductor_resistance_properties {V : Type} {G : DiscreteGraph V}
    (C : ConductorResistance G) : ConductorResistanceClosed C := by
  exact And.intro C.symmetricConductance (And.intro C.definedViaGreen C.reciprocity)

end DiscretePotentialTheoryTheoremCanonicalLaneLean
end HautevilleHouse
