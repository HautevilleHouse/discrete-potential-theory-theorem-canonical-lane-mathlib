import canonicalLaneMathlib.AdmissibleClass
import DiscretePotentialTheoryTheoremCanonicalLaneLean.DiscreteGraph

namespace HautevilleHouse
namespace DiscretePotentialTheoryTheoremCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  DiscreteGraphClosed (A.object : DiscreteGraph)  -- requires projection

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  sorry  -- placeholder; real proof uses A.object.conclusion

end HautevilleHouse
end HautevilleHouse