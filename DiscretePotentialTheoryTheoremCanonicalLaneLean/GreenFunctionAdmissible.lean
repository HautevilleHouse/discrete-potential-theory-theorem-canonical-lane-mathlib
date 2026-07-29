import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DiscretePotentialTheoryCanonicalLaneLean.HarmonicFunctionClosure

namespace HautevilleHouse
namespace DiscretePotentialTheoryCanonicalLaneLean

structure GreenFunctionPackage {H : HarmonicFunctionPackage} (hClosed : HarmonicFunctionClosed H) where
  greenFunction : H.graph → H.graph → ℝ
  poissonEquation : ∀ x, H.laplacian (λ y => greenFunction x y) = λ y => if x = y then 1 else 0
  boundaryVanishes : ∀ x ∈ H.boundary, ∀ y, greenFunction x y = 0
  symmetry : ∀ x y, greenFunction x y = greenFunction y x

def GreenFunctionAdmissible {H : HarmonicFunctionPackage} (hClosed : HarmonicFunctionClosed H) (G : GreenFunctionPackage hClosed) : Prop :=
  G.poissonEquation G.graph.vertices.head ∧ G.boundaryVanishes G.graph.vertices.head

theorem green_function_admissible_from_package {H : HarmonicFunctionPackage} (hClosed : HarmonicFunctionClosed H) (G : GreenFunctionPackage hClosed) :
    GreenFunctionAdmissible hClosed G := by
  refine ⟨?_, ?_⟩
  · exact G.poissonEquation G.graph.vertices.head
  · exact G.boundaryVanishes G.graph.vertices.head

end DiscretePotentialTheoryCanonicalLaneLean
end HautevilleHouse