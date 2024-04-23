cp ~/DRust_home/configs/gam/dht.h ~/DRust_home/GAM-baseline/LibGAM/include/settings.h
bash ~/DRust_home/aescripts/build_gam_dht.sh

for i in {8,7,6,5,4,3,2}; do
    echo "Run KVStore with GAM on $i servers"
    cd ~/DRust_home/GAM-baseline/LibGAM/dht
    bash kv_benchmark.sh $i
    sleep 20
    while true; do
        # Check if the process named 'drust' is running
        if pgrep -f "dht/benchmark" > /dev/null; then
            # If it's running, sleep for 5 seconds
            sleep 5
        else
            # If it's not running, exit the loop
            break
        fi
    done
    echo "GAM DHT is finishes. Exiting in 10 seconds."
    sleep 10
done



cd ~/DRust_home/GAM-baseline/LibGAM/dht_single
bash kv_benchmark.sh 1
sleep 20
while true; do
    # Check if the process named 'drust' is running
    if pgrep -f "dht/benchmark" > /dev/null; then
        # If it's running, sleep for 5 seconds
        sleep 5
    else
        # If it's not running, exit the loop
        break
    fi
done
echo "GAM DHT is finishes. Exiting in 10 seconds."
sleep 10