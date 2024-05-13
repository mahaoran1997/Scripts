cd ~/DRust_home/grappa/build/Make+Release
bash ~/DRust_home/grappa/update_guest.sh applications/kvstore/kvstore
sleep 5
bash ~/DRust_home/grappa/prepare_kvstore.sh 8
mpirun -np 8 --host zion1,zion2,zion3,zion4,zion5,zion6,zion10,zion11  applications/kvstore/kvstore --get_ratio 90 > ~/DRust_home/aescripts/logs/kv_grappa$i.log
sleep 5
bash ~/DRust_home/grappa/prepare_kvstore.sh 7
mpirun -np 7 --host zion1,zion2,zion3,zion4,zion5,zion6,zion10  applications/kvstore/kvstore --get_ratio 90 > ~/DRust_home/aescripts/logs/kv_grappa$i.log
sleep 5
bash ~/DRust_home/grappa/prepare_kvstore.sh 6
mpirun -np 6 --host zion1,zion2,zion3,zion4,zion5,zion6  applications/kvstore/kvstore --get_ratio 90 > ~/DRust_home/aescripts/logs/kv_grappa$i.log
sleep 5
bash ~/DRust_home/grappa/prepare_kvstore.sh 5
mpirun -np 5 --host zion1,zion2,zion3,zion4,zion5  applications/kvstore/kvstore --get_ratio 90 > ~/DRust_home/aescripts/logs/kv_grappa$i.log
sleep 5
bash ~/DRust_home/grappa/prepare_kvstore.sh 4
mpirun -np 4 --host zion1,zion2,zion3,zion4  applications/kvstore/kvstore --get_ratio 90 > ~/DRust_home/aescripts/logs/kv_grappa$i.log
sleep 5
bash ~/DRust_home/grappa/prepare_kvstore.sh 3
mpirun -np 3 --host zion1,zion2,zion3  applications/kvstore/kvstore --get_ratio 90 > ~/DRust_home/aescripts/logs/kv_grappa$i.log
sleep 5
bash ~/DRust_home/grappa/prepare_kvstore.sh 2
mpirun -np 2 --host zion1,zion2  applications/kvstore/kvstore --get_ratio 90 > ~/DRust_home/aescripts/logs/kv_grappa$i.log
sleep 5
bash ~/DRust_home/grappa/prepare_kvstore.sh 1
mpirun -np 1 --host zion1  applications/kvstore/kvstore --get_ratio 90 > ~/DRust_home/aescripts/logs/kv_grappa$i.log