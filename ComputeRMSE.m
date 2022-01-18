function rmse = ComputeRMSE(predictions, targets)

rmse = sqrt(mean((predictions-targets).^2));

end