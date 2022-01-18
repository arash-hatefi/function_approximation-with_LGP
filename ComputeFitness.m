function fitness = ComputeFitness(predictions, targets)

fitness = 1 / ComputeRMSE(predictions, targets);

end