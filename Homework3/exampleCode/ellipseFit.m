function [theta, sse]=ellipseFit(data)
% Ellipse fitting
    M = mean(data,2);
    c_x = M(1,1);
    c_y = M(2,1);
    center0 = [c_x,c_y];	% Initial guess of the center
    center = fminsearch(@(x)sseOfEllipseFit(x, data), center0);	% Use fminsearch to find the best value of x (center)
    [sse, radius] = sseOfEllipseFit(center, data);	% Use sseOfEllipseFit to obtain the final sse &amp; radius
    theta = [center, radius];
end

% Function that returns SSE and the linear parameters
function [sse, radius]=sseOfEllipseFit(center, data)
% Put your function body here...
    [row,col] = size(data);
    A = [data]';
    A = [A(:,1) - center(1),A(:,2) - center(2)];
    A = A.^2;
    b = ones(col,1);
    r = A\b;
    r_square = [1./r]';
    radius = sqrt(r_square);
    sse = 0;
    for i = 1:col
        sse = sse + (((data(1,i) - center(1))/radius(1,1)).^2 + ((data(2,i) - center(2))/radius(1,2)).^2 - 1).^2;
    end
end