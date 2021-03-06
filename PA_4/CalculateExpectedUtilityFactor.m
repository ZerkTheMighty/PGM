% Copyright (C) Daphne Koller, Stanford University, 2012

function EUF = CalculateExpectedUtilityFactor( I )

  % Inputs: An influence diagram I with a single decision node and a single utility node.
  %         I.RandomFactors = list of factors for each random variable.  These are CPDs, with
  %              the child variable = D.var(1)
  %         I.DecisionFactors = factor for the decision node.
  %         I.UtilityFactors = list of factors representing conditional utilities.
  % Return value: A factor over the scope of the decision rule D from I that
  % gives the conditional utility given each assignment for D.var
  %
  % Note - We assume I has a single decision node and utility node.
  U = I.UtilityFactors(1);
  F = [I.RandomFactors U];
 
  jointDistribution = F(1);
  for i = 2:length(F)
      jointDistribution = FactorProduct(F(i), jointDistribution);
  end
  
  variablesToEliminate = setdiff(union([I.RandomFactors.var], U.var), [I.DecisionFactors.var]);
  EUF = VariableElimination(jointDistribution, variablesToEliminate);
  
end  
