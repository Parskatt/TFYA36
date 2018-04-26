function [] = init(assigment,problem)
    %init(assigment,problem):
    %   Initializes the correct assignment based on the input
    %   assigment: number specifying assignment
    %   problem: number specifying problem
    %   Ex: init 5 6
    addpath(genpath(pwd))
    assignpath = ['assign' assigment];
    totpath = [assignpath '/problem' problem];
    if ~exist(assignpath,'dir')
        mkdir(assignpath)
    end
    if ~exist(totpath,'dir') && ~nargin < 2
        mkdir(totpath)
    end
    if nargin < 2
        cd(assignpath)
    else
        cd (totpath)
    end
    addpath(genpath(pwd))
end