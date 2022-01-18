function symbolicFunction = GetSymbolicFunction(chromosome, numberOfVariables, constants)

instructionLength = 4;
chromosomeLength = length(chromosome);
numberOfInstructions = chromosomeLength / instructionLength;

syms x;
registers = [x, zeros(1, numberOfVariables-1), constants];
for instructionIndex=1:numberOfInstructions
	instruction = chromosome((instructionIndex-1)*instructionLength+1 : instructionIndex*instructionLength);
	operatorCode = instruction(1);
	destinationCode = instruction(2);
	operant1Code = instruction(3);
    operant2Code = instruction(4);
    if (operatorCode==1)
        registers(destinationCode) = registers(operant1Code) + registers(operant2Code);
	elseif (operatorCode==2)
        registers(destinationCode) = registers(operant1Code) - registers(operant2Code);
	elseif (operatorCode==3)
        registers(destinationCode) = registers(operant1Code) * registers(operant2Code);
    elseif (operatorCode==4)
        registers(destinationCode) = registers(operant1Code) / registers(operant2Code);
    end
end

[n,d] = numden(registers(1));
symbolicFunction = n/d;

end