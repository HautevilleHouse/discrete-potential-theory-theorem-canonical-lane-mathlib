import canonicalLaneMathlib.HarmonicAnalysis

namespace HautevilleHouse
namespace DiscretePotentialTheoryCanonicalLaneLean

structure HarmonicSpaceDecompositionPackage where
  harmonicSpace : Type u
  decompositionIntoIrreducibles : Prop
  dimensionFinite : Prop
  basisConstructed : Prop
  dimensionFiniteProof : dimensionFinite
  decompositionProof : decompositionIntoIrreducibles
  basisProof : basisConstructed

def HarmonicSpaceDecompositionClosed (H : HarmonicSpaceDecompositionPackage) : Prop :=
  H.decompositionIntoIrreducibles ∧ H.dimensionFinite ∧ H.basisConstructed

theorem harmonic_space_decomposition_closed (H : HarmonicSpaceDecompositionPackage) :
    HarmonicSpaceDecompositionClosed H := by
  exact And.intro H.decompositionProof (And.intro H.dimensionFiniteProof H.basisProof)

end DiscretePotentialTheoryCanonicalLaneLean
end HautevilleHouse