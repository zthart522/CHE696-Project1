#!/usr/bin/bash
# This code iteratively runs the mc code for Project 1.

seeds=(1 2 3 4)
numdens=(0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9)

for s in "${seeds[@]}"; do
    for numden in "${numdens[@]}"; do
        /usr/bin/time -o time_${numden}_$s.dat ./exe/mc.exe "$s" "$numden" | tee log_${numden}_$s.dat
        mv MC_traj.lammpstrj "MC_traj_${numden}_${s}.lammpstrj"
    done
done

mkdir -p trajs
mv ./MC_traj*.lammpstrj ./trajs/

mkdir -p logs
mv ./log*.dat ./logs/

mkdir -p timing
mv ./time_*.dat ./timing/
