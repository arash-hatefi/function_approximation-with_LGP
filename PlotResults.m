function lgpPlot = PlotResults(functionData, ApproximateFunction)

lgpPlot = figure;
xValues = functionData(:,1)';
yValues = functionData(:,2)';

plot(xValues, yValues);
hold on;
plot(xValues, ApplyFunctionOnVector(ApproximateFunction, xValues));
xlabel('x')
ylabel('y')

end

