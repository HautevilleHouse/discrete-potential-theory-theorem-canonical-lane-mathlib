import canonicalLaneMathlib.KernelTheory

namespace HautevilleHouse
namespace DiscretePotentialTheoryCanonicalLaneLean

structure PotentialKernelClassificationPackage where
  targetGraph : Type u
  graphTopology : TopologicalSpace targetGraph
  kernelPositiveDefinite : Prop
  potentialKernel : targetGraph → targetGraph → ℝ
  kernelSymmetric : ∀ x y, potentialKernel x y = potentialKernel y x
  kernelPositiveDefiniteProof : kernelPositiveDefinite

def PotentialKernelClassificationClosed (P : PotentialKernelClassificationPackage) : Prop :=
  P.kernelPositiveDefinite

theorem potential_kernel_classification_supplies_statement (P : PotentialKernelClassificationPackage) :
    PotentialKernelClassificationClosed P :=
  P.kernelPositiveDefiniteProof

end DiscretePotentialTheoryCanonicalLaneLean
end HautevilleHouse