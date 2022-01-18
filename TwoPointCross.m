function [newChromosome1, newChromosome2] = TwoPointCross(chromosome1, chromosome2)

[chromosome1Part1, chromosome1Part2, chromosome1Part3] = CutChromosomeToThreeParts(chromosome1);
[chromosome2Part1, chromosome2Part2, chromosome2Part3] = CutChromosomeToThreeParts(chromosome2);

newChromosome1 = [chromosome1Part1, chromosome2Part2, chromosome1Part3];
newChromosome2 = [chromosome2Part1, chromosome1Part2, chromosome2Part3];

end