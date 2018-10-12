addpath('C:\Users\TomM\Documents\spm12\spm12')
addpath(genpath('C:\Users\TomM\Documents\Repositorys\RFTsim'));

for i = 1:50
    % Generate a smooth RF.
    smoothrf = datagen([100, 100, 100], 1, 0, 5.9);

    % Threshold it
    thrsh=2.2;
    excSet=smoothrf>thrsh;

    % Pad with zeros.
    excSet_pad = zeros(size(excSet,1)+2, size(excSet,2)+2, size(excSet,3)+2);
    excSet_pad(2:101, 2:101, 2:101) = excSet;
    excSet = excSet_pad;

    % Get the number of cubes, faces, edges and points.
    numCubes  = nC(excSet);
    numFaces  = nF(excSet);
    numEdges  = nE(excSet);
    numPoints = nP(excSet);

    % Degenerate edges and points
    numdEdges  = ndE(excSet);
    numd2Points = n2dP(excSet);
    numd3Points = n3dP(excSet);

    % Get intrinsic volumes
    R0_6  = numPoints - numEdges + numFaces - numCubes + numd2Points + numd3Points - numdEdges; 
    R0_18 = numPoints - numEdges + numFaces - numCubes + numd2Points;
    R0_26 = numPoints - numEdges + numFaces - numCubes;
    
    sprintf('R0: 6 %.3f, 18 %.3f, 26 %.3f', R0_6, R0_18, R0_26)
end
    
function nCubes = nC(excSet)

    nCubes = sum(sum(sum(excSet)));

end

function nFaces = nF(excSet)
    
    % Faces matrix for x direction.
    mx1 = excSet(1:101, :, :);
    mx2 = excSet(2:102, :, :);
    faces_x = mx1 + mx2 - mx1.*mx2;
    
    % Number of faces in x direction
    nFx = sum(sum(sum(faces_x)));
    clear x1 x2 faces_x
    
    % Faces matrix for y direction.
    my1 = excSet(:, 1:101, :);
    my2 = excSet(:, 2:102, :);
    faces_y = my1 + my2 - my1.*my2;
    
    % Number of faces in y direction
    nFy = sum(sum(sum(faces_y)));
    clear y1 y2 faces_y
    
    % Faces matrix for z direction.
    z1 = excSet(:, :, 1:101);
    z2 = excSet(:, :, 2:102);
    faces_z = z1 + z2 - z1.*z2;
    
    % Number of faces in z direction
    nFz = sum(sum(sum(faces_z)));
    clear z1 z2 faces_z
    
    % Total number of faces.
    nFaces = nFx + nFy + nFz;

end

function nEdges = nE(excSet)
    
    % Matrices needed for counting edges in x direction.
    mx1 = excSet(:, 1:101, 1:101);
    mx2 = excSet(:, 1:101, 2:102);
    mx3 = excSet(:, 2:102, 2:102);
    mx4 = excSet(:, 2:102, 1:101);
    
    % x or matrices.
    mx1_or_mx2 = mx1 + mx2 - mx1.*mx2;
    mx3_or_mx4 = mx3 + mx4 - mx3.*mx4;
    clear mx1 mx2 mx3 mx4
    
    % Final x or matrix
    x_or_matrix = mx1_or_mx2 + mx3_or_mx4 - mx1_or_mx2.*mx3_or_mx4;
    clear mx1_or_mx2 mx3_or_mx4
   
    % Number of x edges.
    nEx = sum(sum(sum(x_or_matrix)));
    clear x_or_matrix
    
    % Matrices needed for counting edges in y direction.
    my1 = excSet(1:101, :, 1:101);
    my2 = excSet(1:101, :, 2:102);
    my3 = excSet(2:102, :, 2:102);
    my4 = excSet(2:102, :, 1:101);
    
    % y or matrices.
    my1_or_my2 = my1 + my2 - my1.*my2;
    my3_or_my4 = my3 + my4 - my3.*my4;
    clear my1 my2 my3 my4
    
    % Final y or matrix
    y_or_matrix = my1_or_my2 + my3_or_my4 - my1_or_my2.*my3_or_my4;
    clear my1_or_my2
    
    % Number of y edges.
    nEy = sum(sum(sum(y_or_matrix)));
    clear y_or_matrix
    
    % Matrices needed for counting edges in z direction.
    mz1 = excSet(1:101, 1:101, :);
    mz2 = excSet(1:101, 2:102, :);
    mz3 = excSet(2:102, 2:102, :);
    mz4 = excSet(2:102, 1:101, :);
    
    % z or matrices.
    mz1_or_mz2 = mz1 + mz2 - mz1.*mz2;
    mz3_or_mz4 = mz3 + mz4 - mz3.*mz4;
    clear mz1 mz2 mz3 mz4
    
    % Final z or matrix
    z_or_matrix = mz1_or_mz2 + mz3_or_mz4 - mz1_or_mz2.*mz3_or_mz4;
    clear mz1_or_mz2 mz3_or_mz4
    
    % Number of z edges.
    nEz = sum(sum(sum(z_or_matrix)));
    clear z_or_matrix
    
    nEdges = nEx + nEy + nEz;

end

function nDegenEdges = ndE(excSet)

    % Matrices needed for counting edges in x direction.
    mx1 = excSet(:, 1:101, 1:101);
    mx2 = excSet(:, 1:101, 2:102);
    mx3 = excSet(:, 2:102, 2:102);
    mx4 = excSet(:, 2:102, 1:101);
    
    % x and matrices.
    mx1_and_mx3 = mx1.*mx3;
    mx2_and_mx4 = mx2.*mx4;
    not_mx1_and_not_mx3 = (1-mx1).*(1-mx3);
    not_mx2_and_not_mx4 = (1-mx2).*(1-mx4);
    clear mx1 mx2 mx3 mx4
    
    % Degen point matrices (not(A and C) and (B or D))
    dx1 = mx1_and_mx3.*not_mx2_and_not_mx4;
    dx2 = mx2_and_mx4.*not_mx1_and_not_mx3;
    clear mx1_and_mx3 mx2_and_mx4 not_mx1_and_not_mx3 not_mx2_and_not_mx4
    
    % degenerate sum in x direction
    ndEx = sum(sum(sum(dx1)))+sum(sum(sum(dx2)));
    clear dx1 dx2

    % Matrices needed for counting edges in y direction.
    my1 = excSet(1:101, :, 1:101);
    my2 = excSet(1:101, :, 2:102);
    my3 = excSet(2:102, :, 2:102);
    my4 = excSet(2:102, :, 1:101);
    
    % y and matrices.
    my1_and_my3 = my1.*my3;
    my2_and_my4 = my2.*my4;
    not_my1_and_not_my3 = (1-my1).*(1-my3);
    not_my2_and_not_my4 = (1-my2).*(1-my4);
    clear my1 my2 my3 my4
    
    % Degen point matrices (not(A and C) and (B or D))
    dy1 = my1_and_my3.*not_my2_and_not_my4;
    dy2 = my2_and_my4.*not_my1_and_not_my3;
    clear my1_and_my3 my2_and_my4 not_my1_and_not_my3 not_my2_and_not_my4
    
    % degenerate sum in y direction
    ndEy = sum(sum(sum(dy1)))+sum(sum(sum(dy2)));
    clear dy1 dy2    
    
    % Matrices needed for counting edges in z direction.
    mz1 = excSet(1:101, 1:101, :);
    mz2 = excSet(1:101, 2:102, :);
    mz3 = excSet(2:102, 2:102, :);
    mz4 = excSet(2:102, 1:101, :);
    
    % z and matrices.
    mz1_and_mz3 = mz1.*mz3;
    mz2_and_mz4 = mz2.*mz4;
    not_mz1_and_not_mz3 = (1-mz1).*(1-mz3);
    not_mz2_and_not_mz4 = (1-mz2).*(1-mz4);
    clear mz1 mz2 mz3 mz4
    
    % Degen point matrices (not(A and C) and (B or D))
    dz1 = mz1_and_mz3.*not_mz2_and_not_mz4;
    dz2 = mz2_and_mz4.*not_mz1_and_not_mz3;
    clear mz1_and_mz3 mz2_and_mz4 not_mz1_and_not_mz3 not_mz2_and_not_mz4
    
    % degenerate sum in z direction
    ndEz = sum(sum(sum(dz1)))+sum(sum(sum(dz2)));
    clear dz1 dz2
    
    nDegenEdges = ndEx + ndEy + ndEz;

end


function nPoints = nP(excSet)
    
    % Matrices needed for counting points.
    m1 = excSet(1:101, 1:101, 1:101);
    m2 = excSet(1:101, 2:102, 1:101);
    m3 = excSet(2:102, 2:102, 1:101);
    m4 = excSet(2:102, 1:101, 1:101);
    m5 = excSet(1:101, 1:101, 2:102);
    m6 = excSet(1:101, 2:102, 2:102);
    m7 = excSet(2:102, 2:102, 2:102);
    m8 = excSet(2:102, 1:101, 2:102);
    
    % Or matrices
    m1_or_m2 = m1 + m2 - m1.*m2;
    m3_or_m4 = m3 + m4 - m3.*m4;
    m5_or_m6 = m5 + m6 - m5.*m6;
    m7_or_m8 = m7 + m8 - m7.*m8;
    clear m1 m2 m3 m4 m5 m6 m7 m8
    
    m1_or_m2_or_m3_or_m4 = m1_or_m2 + m3_or_m4 - m1_or_m2.*m3_or_m4;
    m5_or_m6_or_m7_or_m8 = m5_or_m6 + m7_or_m8 - m5_or_m6.*m7_or_m8;
    clear m1_or_m2 m3_or_m4 m5_or_m6 m7_or_m8
    
    or_matrix = m1_or_m2_or_m3_or_m4 + m5_or_m6_or_m7_or_m8 - ...
        m1_or_m2_or_m3_or_m4.*m5_or_m6_or_m7_or_m8;
    clear m1_or_m2_or_m3_or_m4 m5_or_m6_or_m7_or_m8
    
    % number of points.
    nPoints = sum(sum(sum(or_matrix)));
    clear or_matrix
end

function n2DegenPoints = n2dP(excSet)

    m1 = excSet(1:101, 1:101, 1:101);
    m2 = excSet(1:101, 2:102, 1:101);
    m3 = excSet(2:102, 2:102, 1:101);
    m4 = excSet(2:102, 1:101, 1:101);
    m5 = excSet(1:101, 1:101, 2:102);
    m6 = excSet(1:101, 2:102, 2:102);
    m7 = excSet(2:102, 2:102, 2:102);
    m8 = excSet(2:102, 1:101, 2:102);
    
    diag1 = m1.*(1-m2).*(1-m3).*(1-m4).*(1-m5).*(1-m6).*m7.*(1-m8);
    diag2 = (1-m1).*m2.*(1-m3).*(1-m4).*(1-m5).*(1-m6).*(1-m7).*m8;
    diag3 = (1-m1).*(1-m2).*m3.*(1-m4).*m5.*(1-m6).*(1-m7).*(1-m8);
    diag4 = (1-m1).*(1-m2).*(1-m3).*m4.*(1-m5).*m6.*(1-m7).*(1-m8);
    clear m1 m2 m3 m4 m5 m6 m7 m8
    
    n2DegenPoints = sum(sum(sum(diag1))) + sum(sum(sum(diag2))) + ...
                    sum(sum(sum(diag3))) + sum(sum(sum(diag4))); 
    clear diag1 diag2 diag3 diag4

end

function n3DegenPoints = n3dP(excSet)

    m1 = excSet(1:101, 1:101, 1:101);
    m2 = excSet(1:101, 2:102, 1:101);
    m3 = excSet(2:102, 2:102, 1:101);
    m4 = excSet(2:102, 1:101, 1:101);
    m5 = excSet(1:101, 1:101, 2:102);
    m6 = excSet(1:101, 2:102, 2:102);
    m7 = excSet(2:102, 2:102, 2:102);
    m8 = excSet(2:102, 1:101, 2:102);
    
    % x=1
    xdiag1 = m1.*m6.*(1-m2).*(1-m5);
    xdiag2 = m2.*m5.*(1-m1).*(1-m6);
    
    % x=2
    xdiag3 = m3.*m8.*(1-m4).*(1-m7);
    xdiag4 = m4.*m7.*(1-m3).*(1-m8);
    
    % Degenerate matrices
    xdeg1 = xdiag1 + xdiag4 - xdiag1.*xdiag4;
    xdeg2 = xdiag2 + xdiag3 - xdiag2.*xdiag3;
    clear xdiag1 xdiag2 xdiag3 xdiag4
    
    % y=1
    ydiag1 = m1.*m8.*(1-m4).*(1-m5);
    ydiag2 = m4.*m5.*(1-m1).*(1-m8);
    
    % y=2
    ydiag3 = m2.*m7.*(1-m3).*(1-m6);
    ydiag4 = m3.*m6.*(1-m2).*(1-m7);
    
    % Degenerate matrices
    ydeg1 = ydiag1 + ydiag3 - ydiag1.*ydiag3;
    ydeg2 = ydiag2 + ydiag4 - ydiag2.*ydiag4;
    clear ydiag1 ydiag2 ydiag3 ydiag4
    
    % z = 1
    zdiag1 = m1.*m3.*(1-m2).*(1-m4);
    zdiag2 = m2.*m4.*(1-m1).*(1-m3);
    
    % z = 2
    zdiag3 = m5.*m7.*(1-m6).*(1-m8);
    zdiag4 = m6.*m8.*(1-m5).*(1-m7);
    
    % Degenerate matrices
    zdeg1 = zdiag1 + zdiag3 - zdiag1.*zdiag3;
    zdeg2 = zdiag2 + zdiag4 - zdiag2.*zdiag4;
    clear zdiag1 zdiag2 zdiag3 zdiag4
    
    n3DegenPoints = sum(sum(sum(xdeg1))) + sum(sum(sum(xdeg2))) + ...
                    sum(sum(sum(ydeg1))) + sum(sum(sum(ydeg2))) + ...
                    sum(sum(sum(zdeg1))) + sum(sum(sum(zdeg2)));

end 