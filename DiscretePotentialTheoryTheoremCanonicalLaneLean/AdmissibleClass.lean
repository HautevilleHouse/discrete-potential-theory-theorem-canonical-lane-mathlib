import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscretePotentialTheoryCanonicalLaneLean

structure DiscretePotentialTheoryAdmittedObject where
  space : Type u
  topology : TopologicalSpace space
  discreteGraph : Prop
  harmonicFunctionSpace : Type v
  potentialKernel : Type w
  kernelPositiveDefinite : Prop
  conclusion : kernelPositiveDefinite

structure DiscretePotentialTheoryAdmissibleClass where
  object : DiscretePotentialTheoryAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : DiscretePotentialTheoryAdmissibleClass) : Prop :=
  DiscretePotentialTheoryWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end DiscretePotentialTheoryCanonicalLaneLean
end HautevilleHouse