for i in {8,7,6,5,4,3,2,1}; do
    echo "Run GEMM on $i servers"
    cp ~/DRust_home/configs/ge/$i.rs ~/DRust_home/DRust/drust/src/conf.rs
    cp ~/DRust_home/configs/$i.h ~/DRust_home/DRust/comm-lib/rdma-common.h
    bash ~/DRust_home/DRust/scripts/local_build.sh
    bash ~/DRust_home/DRust/scripts/copy_executable.sh
    bash ~/DRust_home/DRust/scripts/shutdown.sh
    sleep 5
    bash ~/DRust_home/DRust/scripts/run_workload.sh gemm $i
done