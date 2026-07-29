import canonicalLaneMathlib.AdmissibleClass
import DiscretePotentialTheoryTheoremCanonicalLaneLean.DiscreteGraph

namespace HautevilleHouse
namespace DiscretePotentialTheoryTheoremCanonicalLaneLean

structure GreenFunction (G : DiscreteGraph) (x : G.vertexSet) (y : G.vertexSet) where
  value : ℝ
  harmonicOffDiagonal : ∀ v ≠ x, (∑ e : G.edgeSet, value - value) = 0  -- placeholder

structure GreenEvidence {G : DiscreteGraph} {x y : G.vertexSet} (Gr : GreenFunction G x y) where
  harmonicOffDiagonalClosed : Gr.harmonicOffDiagonal

def GreenClosed {G : DiscreteGraph} {x y : G.vertexSet} (Gr : GreenFunction G x y) : Prop :=
  Gr.harmonicOffDiagonal

theorem green_closed_from_evidence {G : DiscreteGraph} {x y : G.vertexSet}
    (Gr : GreenFunction G x y) (E : GreenEvidence Gr) : GreenClosed Gr := by
  exact E.harmonicOffDiagonalClosed

end HautevilleHouse
end HautevilleHouse