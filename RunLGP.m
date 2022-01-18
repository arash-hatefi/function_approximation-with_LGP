clear;
clc;
close all;

populationSize = 5000;
numberOfVariables = 6;
constants = [0, 0.25, 0.5, 1, 2];
numberOfInstructionsRange = [40,50];
desiredNumberOfInstructions = 50;
chromosomeLengthPenaltyOrder = 1;

tournamentSize = 500;
tournamentProbability = 0.8;
crossoverProbability = 0.7;
subtreeMutationProbability = 0.05;
hoistMutationProbability = 0.05;
numberOfGenerations = 3;

functionData = LoadFunctionData;

[maximumFitness, bestApproximatingChromosome, population] = RunLGPFuncionApproximation(functionData, populationSize, numberOfVariables, constants, numberOfInstructionsRange, tournamentSize, ...
                                                                           tournamentProbability, crossoverProbability, subtreeMutationProbability, hoistMutationProbability, numberOfGenerations, desiredNumberOfInstructions, chromosomeLengthPenaltyOrder);

ApproximateFunction = DecodeChromosome(bestApproximatingChromosome, numberOfVariables, constants);
                   
PlotResults(functionData, ApproximateFunction)

