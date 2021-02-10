function [minDist]=myPvAlign(pv, noteVec)

% pv: Singing pitch vector.
% noteVec: Music note vector.
% minDist: mininum distance after assigning each element in pv to each note in noteVec. (You need to use DP to solve this problem!)
    [pv_row, pv_col] = size(pv);
    [note_row, note_col] = size(noteVec);
    dist = zeros(note_col, pv_col);
    D = zeros(note_col, pv_col);
    for i = 1:note_col
        for j = 1:pv_col
            dist(i, j) = abs(noteVec(i) - pv(j));
            if i == 1 && j == 1
                D(i, j) = dist(i, j);
            elseif i == 1 && j ~= 1
                D(i, j) = dist(i, j) + D(i, j - 1);
            elseif i ~= 1 && j == 1
                D(i, j) = Inf;
            else
                D(i, j) = dist(i, j) + min([D(i, j - 1); D(i - 1, j - 1)]);
            end
        end
    end
    minDist = min(D(:, pv_col));
end