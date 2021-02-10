function coef=planeFitViaTls(data)
% planeFitViaTls: Plane fit via total lease-squares
    [row, col] = size(data);
    M = mean(data, 2);
    temp_M = M;
    for i = 2:col
        temp_M = [temp_M, M];
    end
    X = data - temp_M;
    C = X * X';
    [V, D] = eig(C);
    N = V(:, 1);
    const = N' * M;
    ans = [N; -const];
    if ans(1, 1) < 0
        ans = -ans;
    end
    coef = ans;
end