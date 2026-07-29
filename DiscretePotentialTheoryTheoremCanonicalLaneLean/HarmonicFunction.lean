import canonicalLaneMathlib.AdmissibleClass
import DiscretePotentialTheoryTheoremCanonicalLaneLean.DiscreteGraph

namespace HautevilleHouse
namespace DiscretePotentialTheoryTheoremCanonicalLaneLean

structure HarmonicFunction (G : DiscreteGraph) (φ : G.vertexSet → ℝ) where
  laplacianZero : ∀ v : G.vertexSet, (∑ e : G.edgeSet, φ (G.target e) - φ v) = 0

structure HarmonicEvidence {G : DiscreteGraph} {φ : G.vertexSet → ℝ} (H : HarmonicFunction G φ) where
  laplacianZeroClosed : H.laplacianZero

def HarmonicClosed {G : DiscreteGraph} {φ : G.vertexSet → ℝ} (H : HarmonicFunction G φ) : Prop :=
  H.laplacianZero

theorem harmonic_closed_from_evidence {G : DiscreteGraph} {φ : G.vertexSet → ℝ}
    (H : HarmonicFunction G φ) (E : HarmonicEvidence H) : HarmonicClosed H := by
  exact E.laplacianZeroClosed

end HautevilleHouse
end HautevilleHouse