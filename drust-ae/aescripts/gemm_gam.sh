for i in {8,7,6,5,4,3,2}; do
    echo "Run GEMM with GAM on $i servers"
    cp ~/DRust_home/configs/gam/gemm.h ~/DRust_home/GAM-baseline/LibGAM/include/settings.h
    cp ~/DRust_home/configs/gam/ge/$i.rs ~/DRust_home/GAM-baseline/Applications/src/conf.rs
    bash ~/DRust_home/GAM-baseline/build_gam.sh
    bash ~/DRust_home/GAM-baseline/shutdown.sh
    sleep 5
    bash ~/DRust_home/GAM-baseline/run_gam.sh 3 $i
done



echo "Run GEMM with GAM on 1 server"
cp ~/DRust_home/configs/gam/local.h ~/DRust_home/GAM-baseline/LibGAM/include/settings.h
cp ~/DRust_home/configs/gam/ge/1.rs ~/DRust_home/GAM-baseline/Applications/src/conf.rs
bash ~/DRust_home/GAM-baseline/build_gam.sh
bash ~/DRust_home/GAM-baseline/shutdown.sh
sleep 5
bash ~/DRust_home/GAM-baseline/run_gam.sh 3 1