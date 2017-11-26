function [ mse_error ] = compute_mse( matrix_a, matrix_b )
% COMPUTE_MSE
% Compute and returns the Mean Squared Error between two matrices.

mse_error = immse(matrix_a, matrix_b);

end

