function mutatedChromosome = SubtreeMutation(chromosome, numberOfVariables, constants)

instructionLength = 4;
numberOfGens = length(chromosome);
numberOfInstructions = numberOfGens / instructionLength;
numberOfInstructionsInSubtree = randi(numberOfInstructions-1);

newSubTree = InitializeChromosome(numberOfInstructionsInSubtree, numberOfVariables, constants);
mutatedChromosome = [newSubTree, chromosome(numberOfInstructionsInSubtree*instructionLength+1:end)];

    
end