function instruction = InitializeInstruction(numberOfVariables, numberOfConstants)

numberOfOperators = 4;
instructionLength = 4;
numberOfRegisters = numberOfConstants + numberOfVariables;
instruction = zeros(1,instructionLength);
instruction(1) = randi(numberOfOperators);
instruction(2) = randi(numberOfVariables);
instruction(3) = randi(numberOfRegisters);
instruction(4) = randi(numberOfRegisters);

end