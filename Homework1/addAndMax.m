function output=addAndMax(a, b)
% Returns the maximum element of the sum of two matrices with mismatched sizes
 
% Put your code here to replace the next line...
    if size(a) == size(b)
        ans = a + b;
    else
        [ra, ca] = size(a);
        [rb, cb] = size(b);
        r = max(ra, rb);
        c = max(ca, cb);
        if ra < r
            a = [a; zeros(r - ra, ca)];
        end
        if rb < r
            b = [b; zeros(r - rb, cb)];
        end
        if ca < c
            a = [a, zeros(r, c - ca)];
        end
        if cb < c
            b = [b, zeros(r, c - cb)];
        end
        ans = a + b;
    end
    output = max(max(ans));
end