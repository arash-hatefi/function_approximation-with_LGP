function DecodedFunction = DecodeChromosome(chromosome, numberOfVariables, constants)

    instructionLength = 4;
    chromosomeLength = length(chromosome);
    numberOfInstructions = chromosomeLength / instructionLength;
    
    function y = temp(x)
        variables = zeros(1, numberOfVariables);
        variables(1) = x;
        registers = [variables, constants];
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
                if (registers(operant2Code)==0)
                    registers(destinationCode) = registers(operant1Code);
                else
                    registers(destinationCode) = registers(operant1Code) / registers(operant2Code);
                end
            end
        end
        y = registers(1);
    end

    DecodedFunction = @(x) temp(x);

end