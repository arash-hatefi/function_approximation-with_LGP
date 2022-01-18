function selectedIndividualIndex = TournamentSelect(fitnessList, tournamentProbability, tournamentSize)

populationSize = length(fitnessList);
[~, sortIndices] = sort(fitnessList,'descend');
RandomIndicesInSortIndices = randi([1, populationSize],[1, tournamentSize]);
sortedRandomIndicesInSortIndices = sort(RandomIndicesInSortIndices, 'ascend');
indicesOfIndividualsInTournament = sortIndices(sortedRandomIndicesInSortIndices);

individualChoosingProbability = tournamentProbability;
for index=1:tournamentSize
    if (rand<individualChoosingProbability || index==tournamentSize)
        selectedIndividualIndex = indicesOfIndividualsInTournament(index);
        break
    else
        individualChoosingProbability = individualChoosingProbability + (1-tournamentProbability)*individualChoosingProbability;
    end
end

end