import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DiscretePotentialTheoryTheoremCanonicalLaneLean.DiscreteGreenFunction

namespace HautevilleHouse
namespace DiscretePotentialTheoryTheoremCanonicalLaneLean

structure RandomWalkData {V : Type} (G : DiscreteGraph V) where
  transitionProb : V → V → ℝ
  stochasticity : ∀ v : V, ∑' u : V, transitionProb v u = 1
  supportedOnEdges : ∀ u v : V, transitionProb u v ≠ 0 → G.edges u v

structure RandomWalkBoundary {V : Type} {G : DiscreteGraph V} (R : RandomWalkData G) where
  exitDistribution : V → (Set V) → ℝ
  harmonicAtInterior : ∀ v : V, v ∉ boundarySet →
    (∑' u : V, R.transitionProb v u * exitDistribution u boundarySet) = exitDistribution v boundarySet
  boundarySet : Set V

def RandomWalkBoundaryClosed {V : Type} {G : DiscreteGraph V} {R : RandomWalkData G}
    (B : RandomWalkBoundary R) : Prop :=
  (∀ v : V, v ∉ B.boundarySet → (∑' u : V, R.transitionProb v u * B.exitDistribution u B.boundarySet) = B.exitDistribution v B.boundarySet)

theorem random_walk_boundary_harmonic {V : Type} {G : DiscreteGraph V} {R : RandomWalkData G}
    (B : RandomWalkBoundary R) : RandomWalkBoundaryClosed B := by
  intro v
  intro hv
  exact B.harmonicAtInterior v hv

end DiscretePotentialTheoryTheoremCanonicalLaneLean
end HautevilleHouse
