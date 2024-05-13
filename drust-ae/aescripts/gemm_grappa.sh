cd ~/DRust_home/grappa/build/Make+Release
bash ~/DRust_home/grappa/update_guest.sh applications/matrix/matmul.exe
for i in {8,7,6,5,4,3,2}; do
    sleep 5
    corenum=$((16*$i))
    echo "Running gemm on Grappa with $corenum cores"
    mpirun -np $corenum --hostfile ~/DRust_home/grappa/hostsfile_haoran$i applications/matrix/matmul.exe --locale_shared_fraction 0.8 --global_heap_fraction 0.5 > ~/DRust_home/aescripts/logs/ge_grappa$i.log
done