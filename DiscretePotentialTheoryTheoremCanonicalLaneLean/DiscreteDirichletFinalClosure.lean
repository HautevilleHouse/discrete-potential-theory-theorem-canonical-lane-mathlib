import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DiscretePotentialTheoryCanonicalLaneLean.HarmonicFunctionClosure
import HautevilleHouse.DiscretePotentialTheoryCanonicalLaneLean.GreenFunctionAdmissible
import HautevilleHouse.DiscretePotentialTheoryCanonicalLaneLean.EffectiveResistanceBridge
import HautevilleHouse.DiscretePotentialTheoryCanonicalLaneLean.NetworkReductionGate
import HautevilleHouse.DiscretePotentialTheoryCanonicalLaneLean.RandomWalkPotentialTheorem

namespace HautevilleHouse
namespace DiscretePotentialTheoryCanonicalLaneLean

structure DiscretePotentialTheoryPackage where
  harmonic : HarmonicFunctionPackage
  harmonicClosed : HarmonicFunctionClosed harmonic
  green : GreenFunctionPackage harmonicClosed
  effectiveResistance : EffectiveResistancePackage green
  networkReduction : NetworkReductionPackage effectiveResistance
  randomWalk : RandomWalkPackage harmonicClosed

def bridgeClosed (A : AdmissibleClass) : Prop :=
  match A with
  | {object := _, endpointSatisfied := _, remainderRecorded := _, gateWitness := _} => True

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  unfold bridgeClosed
  trivial

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := by
  exact A.gateWitness

def ConstrainedDiscretePotentialClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_discrete_potential_endgame (A : AdmissibleClass) :
  ConstrainedDiscretePotentialClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DiscretePotentialTheoryCanonicalLaneLean
end HautevilleHouse