function yValues = ApplyFunctionOnVector(f, xValues)

numberOfvalues = length(xValues);
yValues = zeros(1, numberOfvalues);
for valueIndex=1:numberOfvalues
    yValues(valueIndex) = f(xValues(valueIndex));
end

end

