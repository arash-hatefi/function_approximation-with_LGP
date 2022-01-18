function mutatedChromosome = HoistMutation(chromosome)

instructionLength = 4;
numberOfGens = length(chromosome);
numberOfInstructions = numberOfGens / instructionLength;

startIndex = randi([0, numberOfInstructions-1]);
endIndex = randi([startIndex+1, numberOfInstructions]);

mutatedChromosome = [chromosome(1:startIndex),chromosome(endIndex:end)];

end