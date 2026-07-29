import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscretePotentialTheoryTheoremCanonicalLaneLean

structure DirichletProblemPackage (G : DiscreteGreenFunctionPackage) where
  harmonicFunction : (G.graph → ℝ) → Prop
  boundaryValue : G.boundary → ℝ
  solutionExistence : Prop
  solutionUniqueness : Prop
  maximumPrinciple : Prop
  solutionExistenceTerm : solutionExistence
  solutionUniquenessTerm : solutionUniqueness
  maximumPrincipleTerm : maximumPrinciple

structure DirichletProblemEvidence {G : DiscreteGreenFunctionPackage}
    (D : DirichletProblemPackage G) where
  solutionExistenceClosed : D.solutionExistence
  solutionUniquenessClosed : D.solutionUniqueness
  maximumPrincipleClosed : D.maximumPrinciple

def DirichletProblemClosed {G : DiscreteGreenFunctionPackage}
    (D : DirichletProblemPackage G) : Prop :=
  D.solutionExistence ∧ D.solutionUniqueness ∧ D.maximumPrinciple

theorem dirichlet_problem_closed_from_evidence
    {G : DiscreteGreenFunctionPackage} (D : DirichletProblemPackage G)
    (E : DirichletProblemEvidence D) : DirichletProblemClosed D := by
  exact And.intro E.solutionExistenceClosed
    (And.intro E.solutionUniquenessClosed E.maximumPrincipleClosed)

end DiscretePotentialTheoryTheoremCanonicalLaneLean
end HautevilleHouse