% This file stores parameters for three FANUC robot arms
%   LRMate200iD
%   LRMate200iD/7L
%   M16iB

function robot=robotproperty(id)
robot.name = id;
switch id
    case 'LRMate200iD'
        robot.nlink=6;
        robot.DH=[0,0,0.050,1.5708;
                  1.5708,0,0.330,0;
                  0,0,0.035,-1.5708;
                  0,-0.335,0,1.5708;
                  0,0,0,-1.5708;
                  0,-0.080,0,3.1416];%theta,d,a,alpha
        robot.base=[0;0;0.329];%origin
    case 'LRMate200iD7L'
        robot.nlink=6;
        robot.DH=[0,0,0.050,  -1.5708;
                  -1.5708,0,0.440,3.1416;
                  0,0,0.035,-1.5708;
                  0,-0.42    ,0,1.5708;
                  0,0,0,-1.5708;
                  0,-0.080,0,3.1416];%theta,d,a,alpha
        robot.base=[0;0;0.329];%origin
    case 'M16iB'
        %the constants
        robot.nlink=6;
        robot.DH=[0, 0.65, 0.15, 1.5708;
            1.5708, 0, 0.77, 0;
            0, 0, 0.1, 1.5708;
            0, 0.74, 0, -1.5708;
            -pi/2, 0, 0, 1.5708;
            pi, 0.1, 0, 0];%theta,d,a,alpha
        robot.base=[0;0;0];%origin
end
end