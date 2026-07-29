import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscretePotentialTheoryTheoremCanonicalLaneLean

structure DiscreteGraph where
  vertexSet : Type
  edgeSet : Type
  source : edgeSet → vertexSet
  target : edgeSet → vertexSet
  localFinite : Prop

structure DiscreteGraphEvidence (G : DiscreteGraph) where
  localFiniteClosed : G.localFinite

def DiscreteGraphClosed (G : DiscreteGraph) : Prop :=
  G.localFinite

theorem discrete_graph_closed_from_evidence (G : DiscreteGraph) (E : DiscreteGraphEvidence G) :
    DiscreteGraphClosed G := by
  exact E.localFiniteClosed

end HautevilleHouse
end HautevilleHouse