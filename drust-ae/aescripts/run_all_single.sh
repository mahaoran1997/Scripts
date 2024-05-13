cd ~/DRust_home/DRust/applications/dataframe
~/.cargo/bin/cargo run --release
cd ~/DRust_home/DRust/applications/gemm
~/.cargo/bin/cargo run --release
cd ~/DRust_home/DRust/applications/kv
~/.cargo/bin/cargo run --release
cd ~/DRust_home/aescripts
bash sn_single.sh 2>&1 | tee logs/sn_single.log