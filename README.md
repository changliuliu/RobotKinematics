# RobotKinematics
Illustration of robot kinematics and D-H parameters. Contain live script to visualize the robot configurations.

Require Matlab2019a or above

Run Visualization.mlx to visualize robot configurations.

![](https://github.com/changliuliu/RobotKinematics/blob/master/illustration.png)

## Supported Robot Types

Currently contain the following CAD models:
1. FANUC LRMate200iD
2. FANUC LRMate200iD/7L
3. FANUC M16iB

Capsule models for LRMate200iD and M16iB are also provided.

## How to Add A New Robot Model

Suppose we want to add a new robot called `myBot`, we need to:
1. Add a new case `myBot` in ```robotproperty.m``` (need to specify number of links, D-H parameters, and base)
2. Add `.mat` mesh model(s) of `myBot` in the folder ```figure```

* If the mesh model is generated from a CAD model, name it `myBot.mat`. *To generate `.mat` mesh model from `.stl` file, 1) get `stlread` from [link](https://www.mathworks.com/matlabcentral/fileexchange/29906-binary-stl-file-reader), 2) modify and run `RobotCADFromSTL`. 

    If the model doesn't work as expected. There mainly two possibl reasons: 1. There are multiple definitions of D-H parameter, we are using this one, https://en.wikipedia.org/wiki/Denavit%E2%80%93Hartenberg_parameters#Denavit%E2%80%93Hartenberg_matrix; 2. Make sure the reference frame located at the former joint for each link rather than the latter joint. This will lead to different D-H parameters.

* If the mesh model is generated from a capsule model, name it `myBotCapsules.mat`.