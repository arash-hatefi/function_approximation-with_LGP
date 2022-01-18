function [] = TestLGPChromosome

close all;

functionData = LoadFunctionData;
xValues = functionData(:,1)';
yValues = functionData(:,2)';

numberOfVariables = 6;
constants = [0, 0.25, 0.5, 1, 2];

chromosome = BestChromosome();

decodedChromosome = DecodeChromosome(chromosome, numberOfVariables, constants);
predictions = ApplyFunctionOnVector(decodedChromosome, xValues);

scatter(xValues, yValues);
hold on;
plot(xValues, predictions);
xlabel('x')
ylabel('y')
grid on;

symbolicFunction = GetSymbolicFunction(chromosome, numberOfVariables, constants);
fprintf("\nApproximate Function: %s \n", char(symbolicFunction));

rmse = 1/ComputeFitness(predictions, yValues);
fprintf("\nRMSE: %f\n", rmse);

%% Uncomment for printing the exact set of instructions in the best chromosome
% fprintf("\nGenerating set of instructions in the best chromosome...");
% instructionsString = GetInstructionsString(chromosome, numberOfVariables, constants);
% fprintf("\rSet of Instructions in Chromosome:\t\t\t\t\n");
% fprintf(string(instructionsString));

end

