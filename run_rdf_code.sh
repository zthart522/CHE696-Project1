#!/usr/bin/bash
# This code iteratively runs the mc code for Project 1.

seeds=(1 2 3 4)
numdens=(0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9)

for numden in "${numdens[@]}"; do
	for s in "${seeds[@]}"; do
        	cat "./trajs/MC_traj_${numden}_${s}.lammpstrj" >> "combined_${numden}.lammpstrj"
	done
	./exe/rdf.exe "combined_${numden}.lammpstrj" 0.2
	mv ./rdf.dat "rdf_${numden}.dat"
done

mkdir -p rdfs
mv ./rdf*.dat ./rdfs/
mv combined* ./rdfs/
