function theta=circleFitByDss(data)
% Circle fitting

% Put your code here to replace the next line...
    theta = [0; 0; 0];
    [row, col] = size(data);
    M = mean(data, 2);
    a = M(1, 1);
    b = M(2, 1);
    d_sum = 0;
    for i = 1:col
        d_sum = d_sum + sqrt((data(1, i) - a).^2 + (data(2, i) - b).^2);
    end
    r = d_sum / col;
    x0 = [a, b, r];
    theta = fminsearch(@(x) objective(data, x), x0);
end

function y = objective(data, x)
    [row, col] = size(data);
    y = 0;
    for i = 1:col
        y = y + abs(sqrt((data(1, i) - x(1)).^2 + (data(2, i) - x(2)).^2) - x(3));
    end
end