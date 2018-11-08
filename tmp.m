% Temp check
x = zeros(2, 2, 2);
x(1, 1, 2) = 1;
x(2, 2, 2) = 1;
x(2, 1, 1) = 1;
x(1, 2, 1) = 1;
x(1, 1, 1) = 1;
excSet = x;
d = size(excSet, 1)+2;

% Pad with zeros.
excSet_pad = zeros(d, d, d);
excSet_pad(2:(d-1), 2:(d-1), 2:(d-1)) = excSet;
excSet = excSet_pad;
    
tmp2=n3dP(excSet);

function count = n3dP(excSet)

    d = size(excSet,1);
    count = 0;
    
    for i = 1:(d-1)
        for j = 1:(d-1)
            for k = 1:(d-1)
                
                currentCube = excSet(i:i+1,j:j+1,k:k+1);
                
                % x
                cs1 = currentCube(1, :, :);
                cs2 = currentCube(2, :, :);
                diag = [0, 1; 1, 0];
                count = updateCount(diag, cs1, cs2, count);
                diag = [1, 0; 0, 1];
                count = updateCount(diag, cs1, cs2, count);
                
                cs2 = currentCube(1, :, :);
                cs1 = currentCube(2, :, :);
                diag = [0, 1; 1, 0];
                count = updateCount(diag, cs1, cs2, count);
                diag = [1, 0; 0, 1];
                count = updateCount(diag, cs1, cs2, count);
                
                % y
                cs1 = currentCube(:, 1, :);
                cs2 = currentCube(:, 2, :);
                diag = [0, 1; 1, 0];
                count = updateCount(diag, cs1, cs2, count);
                diag = [1, 0; 0, 1];
                count = updateCount(diag, cs1, cs2, count);
                
                cs2 = currentCube(:, 1, :);
                cs1 = currentCube(:, 2, :);
                diag = [0, 1; 1, 0];
                count = updateCount(diag, cs1, cs2, count);
                diag = [1, 0; 0, 1];
                count = updateCount(diag, cs1, cs2, count);
                
                % z
                cs1 = currentCube(:, :, 1);
                cs2 = currentCube(:, :, 2);
                diag = [0, 1; 1, 0];
                count = updateCount(diag, cs1, cs2, count);
                diag = [1, 0; 0, 1];
                count = updateCount(diag, cs1, cs2, count);
                
                cs2 = currentCube(:, 1, :);
                cs1 = currentCube(:, 2, :);
                diag = [0, 1; 1, 0];
                count = updateCount(diag, cs1, cs2, count);
                diag = [1, 0; 0, 1];
                count = updateCount(diag, cs1, cs2, count);
                
            end
        end
    end 
    
end
    
function count = updateCount(diag, cs1, cs2, count)
    
    % In this case this will get counted twice so halve
    if isequal(squeeze(cs1), diag) && isequal(squeeze(cs2), (1-diag))
        count = count + 0.5;
    elseif isequal(squeeze(cs1), diag) && sum(sum(cs2))<3
        count = count + 1;
    end
    
end