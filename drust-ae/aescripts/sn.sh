for i in {8,7,6,5,4,3,2,1}; do
    echo "Run SocialNet on $i servers"
    cp ~/DRust_home/configs/$i.rs ~/DRust_home/DRust/drust/src/conf.rs
    cp ~/DRust_home/configs/$i.h ~/DRust_home/DRust/comm-lib/rdma-common.h
    cp ~/DRust_home/configs/sn/$i.rs ~/DRust_home/DRust/drust/src/app/socialnet/conf.rs
    bash ~/DRust_home/DRust/scripts/local_build.sh
    bash ~/DRust_home/DRust/scripts/copy_executable.sh
    bash ~/DRust_home/DRust/scripts/shutdown.sh
    sleep 5
    bash ~/DRust_home/DRust/scripts/run_workload.sh sn $i
done