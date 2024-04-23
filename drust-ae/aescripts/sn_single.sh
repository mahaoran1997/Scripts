#!/bin/bash
for i in {8,7,6,5,4,3,2,1}; do
    echo "Run SocialNet with GAM on $i servers"
    cp ~/DRust_home/configs/gam/sn.h ~/DRust_home/GAM-baseline/LibGAM/include/settings.h
    cp ~/DRust_home/configs/gam/sn/conf$i.rs ~/DRust_home/GAM-baseline/Applications/src/app/socialnet_value/conf.rs
    cp ~/DRust_home/configs/gam/sn/$i.rs ~/DRust_home/GAM-baseline/Applications/src/conf.rs
    bash ~/DRust_home/GAM-baseline/build_gam.sh
    bash ~/DRust_home/GAM-baseline/shutdown.sh
    sleep 5
    bash ~/DRust_home/GAM-baseline/run_gam.sh 4 $i
done