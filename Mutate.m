function mutatedChromosome = Mutate(chromosome, numberOfVariables, numberOfConstants)

mutationProbability = 1 / length(chromosome);
numberOfOperators = 4;
numberOfRegisters = numberOfVariables + numberOfConstants;
numberOfGens = length(chromosome);
mutatedChromosome = chromosome;
for genIndex=1:numberOfGens
    if (rand<mutationProbability)
        if (rem(genIndex,4)==1)
            mutatedChromosome(genIndex) = randi(numberOfOperators);
        elseif (rem(genIndex,4)==2)
            mutatedChromosome(genIndex) = randi(numberOfVariables);
        elseif (rem(genIndex,4)==3)
            mutatedChromosome(genIndex) = randi(numberOfRegisters);
        elseif (rem(genIndex,4)==0)
            mutatedChromosome(genIndex) = randi(numberOfRegisters);
        end
    end
end
    
end