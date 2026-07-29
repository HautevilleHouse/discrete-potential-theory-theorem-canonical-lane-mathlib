import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscretePotentialTheoryTheoremCanonicalLaneLean

def ConstrainedDiscretePotentialClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_discrete_potential_endgame (A : AdmissibleClass) :
    ConstrainedDiscretePotentialClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DiscretePotentialTheoryTheoremCanonicalLaneLean
end HautevilleHouse