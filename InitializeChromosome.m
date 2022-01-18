function chromosome = InitializeChromosome(numberOfInstructions, numberOfVariables, constants)

numberOfConstants = size(constants, 1);
instructionLength = 4;
numberOfGenes = instructionLength*numberOfInstructions;
chromosome = zeros(1, numberOfGenes);

for instructionIndex=1:numberOfInstructions
    instruction = InitializeInstruction(numberOfVariables, numberOfConstants);
    chromosome((instructionIndex-1)*instructionLength+1 : instructionIndex*instructionLength) = instruction;
end

f = DecodeChromosome(chromosome, numberOfVariables, constants);

% A symple way to be sure that the generated chromosome does not result in
% a constant function (which is useless for approiximating the given time series)
if (f(100*rand)==f(100*rand)&&f(100*rand)==f(100*rand))
    chromosome = InitializeChromosome(numberOfInstructions, numberOfVariables, numberOfConstants);
end

end

