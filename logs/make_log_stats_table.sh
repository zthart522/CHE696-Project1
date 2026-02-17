#!/usr/bin/env bash

echo "Density  E_mean  E_sem  P_mean  P_sem  Cv_mean  Cv_sem  Mu_mean  Mu_sem" > log_table_stats.dat

awk '
NR>1 {
    d=$1
    E[d]+=$3
    P[d]+=$4
    Cv[d]+=$5
    Mu[d]+=$6

    E2[d]+=$3*$3
    P2[d]+=$4*$4
    Cv2[d]+=$5*$5
    Mu2[d]+=$6*$6

    count[d]++
}
END {
    for (d in count) {
        n=count[d]

        Em=E[d]/n
        Pm=P[d]/n
        Cvm=Cv[d]/n
        Mum=Mu[d]/n

        Es=sqrt((E2[d]/n - Em*Em)/(n-1))
        Ps=sqrt((P2[d]/n - Pm*Pm)/(n-1))
        Cvs=sqrt((Cv2[d]/n - Cvm*Cvm)/(n-1))
        Mus=sqrt((Mu2[d]/n - Mum*Mum)/(n-1))

        # standard error of mean
        Esem=Es/sqrt(n)
        Psem=Ps/sqrt(n)
        Cvsem=Cvs/sqrt(n)
        Musem=Mus/sqrt(n)

        printf "%s  %.6f  %.6f  %.6f  %.6f  %.6f  %.6f  %.6f  %.6f\n",
        d, Em, Esem, Pm, Psem, Cvm, Cvsem, Mum, Musem
    }
}
' log_table.dat | sort -n >> log_table_stats.dat

