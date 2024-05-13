cd ~/DRust_home/aescripts
bash dataframe_grappa.sh 2>&1 | tee logs/df_grappa.log
cd ~/DRust_home/aescripts
bash gemm_grappa.sh 2>&1 | tee logs/ge_grappa.log
cd ~/DRust_home/aescripts
bash kv_grappa.sh 2>&1 | tee logs/kv_grappa.log
cd ~/DRust_home/aescripts
bash sn_grappa.sh 2>&1 | tee logs/sn_grappa.log
 