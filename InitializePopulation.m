function population = InitializePopulation(populationSize, numberOfInstructionsRange, numberOfVariables, constants)
  
high = numberOfInstructionsRange(2);
low = numberOfInstructionsRange(1);

population = cell(1,populationSize);
for index=1:populationSize
    numberOfInstructions = randi([low, high]);
    population{index} = InitializeChromosome(numberOfInstructions, numberOfVariables, constants);
end

end
