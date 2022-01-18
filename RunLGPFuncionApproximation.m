function [maximumFitness, bestApproximatingChromosome, population] = RunLGPFuncionApproximation(functionData, populationSize, numberOfVariables, constants, numberOfInstructionsRange, tournamentSize, ...
                                                                                    tournamentProbability, crossoverProbability, subtreeMutationProbability, hoistMutationProbability, numberOfGenerations, desiredNumberOfInstructions, chromosomeLengthPenaltyOrder)
                                                                             
xValues = functionData(:,1)';
yValues = functionData(:,2)';

instructionLength = 4;
numberOfConstants = length(constants);
desiredChromosomeLength = desiredNumberOfInstructions * instructionLength;

maximumFitness  = 0;
bestApproximatingChromosome = nan;
population = InitializePopulation(populationSize, numberOfInstructionsRange, numberOfVariables, constants);
for generation = 1:numberOfGenerations
    fitnessList = zeros(1, populationSize);
    for individualIndex = 1:populationSize
        chromosome = population{individualIndex};
        DecodedFunction = DecodeChromosome(chromosome, numberOfVariables, constants);
        predictions = ApplyFunctionOnVector(DecodedFunction, xValues);
        fitness = ComputeFitness(predictions, yValues);
        penalizedFitnessvalue = PenalizeFitnessValue(fitness, length(chromosome), desiredChromosomeLength, chromosomeLengthPenaltyOrder);
        fitnessList(individualIndex) = penalizedFitnessvalue;
        if (fitnessList(individualIndex) > maximumFitness) 
            maximumFitness  = fitnessList(individualIndex);
            bestApproximatingChromosome = population{individualIndex};
        end
    end
 
    temporaryPopulation = population;  
    for individualIndex = 1:2:populationSize
        i1 = TournamentSelect(fitnessList,tournamentProbability,tournamentSize);
        i2 = TournamentSelect(fitnessList,tournamentProbability,tournamentSize);
        r = rand;
        if (r < crossoverProbability) 
            chromosome1 = population{i1};
            chromosome2 = population{i2};
            [newChromosome1, newChromosome2] = TwoPointCross(chromosome1, chromosome2);
            temporaryPopulation{individualIndex} = newChromosome1;
            temporaryPopulation{individualIndex+1} = newChromosome2;
        else
            temporaryPopulation{individualIndex} = population{i1};
            temporaryPopulation{individualIndex+1} = population{i2};     
        end
    end
    
    for i=1:2
        temporaryPopulation{i} = bestApproximatingChromosome;
    end
	for individualIndex = 2:populationSize
        if (rand<subtreeMutationProbability)
            tempIndividual = SubtreeMutation(temporaryPopulation{individualIndex}, numberOfVariables, constants);
            temporaryPopulation{individualIndex} = tempIndividual;
        end
        if (rand<hoistMutationProbability)
            tempIndividual = HoistMutation(temporaryPopulation{individualIndex});
            temporaryPopulation{individualIndex} = tempIndividual;
        end
        tempIndividual = Mutate(temporaryPopulation{individualIndex}, numberOfVariables, numberOfConstants);
        temporaryPopulation{individualIndex} = tempIndividual;
	end
	population = temporaryPopulation;
    averagePopLength = 0;
    for i=1:length(population)
        averagePopLength = averagePopLength + length(population{i});
    end
    averagePopLength = averagePopLength / length(population);
    fprintf("Generation %d    Error: %f    av: %f \n", generation, 1/maximumFitness, averagePopLength);
end

end