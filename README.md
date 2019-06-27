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

* If the mesh model is generated from a CAD model, name it `myBot.mat`. *To generate `.mat` mesh model from `.stl` file, 1) get `stlread` from [link](https://www.mathworks.com/matlabcentral/fileexchange/22409-stl-file-reader), 2) modify and run `RobotCADFromSTL`. 

* If the mesh model is generated from a capsule model, name it `myBotCapsules.mat`.