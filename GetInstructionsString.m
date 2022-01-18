function str = GetInstructionsString(chromosome, numberOfVariables, constants)

operatorsString = ["+", "-", "*", "/"];
variablesString = string(1:numberOfVariables);
for i=1:numberOfVariables
    variablesString(i) = "x"+variablesString(i);
end
registersString = [variablesString, string(constants)];

instructionLength = 4;
chromosomeLength = length(chromosome);
numberOfInstructions = chromosomeLength / instructionLength;

syms x;
registers = [x, zeros(1, numberOfVariables-1), constants];

str = "";
for instructionIndex=1:numberOfInstructions
    
	instruction = chromosome((instructionIndex-1)*instructionLength+1 : instructionIndex*instructionLength);
	operatorCode = instruction(1);
	destinationCode = instruction(2);
	operant1Code = instruction(3);
    operant2Code = instruction(4);
    
    destination = registersString(destinationCode);
    operator = operatorsString(operatorCode);
    operant1 = registersString(operant1Code);
    operant2 = registersString(operant2Code);
    
    str = str + sprintf("%s = %s %s %s\t\t", destination, operant1, operator, operant2);
    
    if (operatorCode==1)
        registers(destinationCode) = registers(operant1Code) + registers(operant2Code);
	elseif (operatorCode==2)
        registers(destinationCode) = registers(operant1Code) - registers(operant2Code);
	elseif (operatorCode==3)
        registers(destinationCode) = registers(operant1Code) * registers(operant2Code);
    elseif (operatorCode==4)
        registers(destinationCode) = registers(operant1Code) / registers(operant2Code);
    end
    
    for i=1:numberOfVariables
        str = str + sprintf("x%d = ", i);
        str = str + string(simplify(registers(i))) + "   ";
    end
    
    str = str + "\n";
    
end

str = string(str);
end