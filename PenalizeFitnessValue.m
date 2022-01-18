function penalizedFitnessvalue = PenalizeFitnessValue(fitnessValue, chromosomeLength, targetChromosomeLength, order)

penalty = (targetChromosomeLength / max(targetChromosomeLength, chromosomeLength))^order;
penalizedFitnessvalue = penalty * fitnessValue;

end

