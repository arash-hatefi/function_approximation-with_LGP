function [part1, part2, part3] = CutChromosomeToThreeParts(chromosome)

instructionLength = 4;
numberOfGens = length(chromosome);
numberOfInstructions = numberOfGens / instructionLength;
crossoverIndex1 = randi([1, numberOfInstructions-1]);
crossoverIndex2 = randi([crossoverIndex1, numberOfInstructions-1]);

crossoverIndex1 = crossoverIndex1 * instructionLength;
crossoverIndex2 = crossoverIndex2 * instructionLength;

part1 = chromosome(1 : crossoverIndex1);
part2 = chromosome(crossoverIndex1+1 : crossoverIndex2);
part3 = chromosome(crossoverIndex2+1 : end);

end