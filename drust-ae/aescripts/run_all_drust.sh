bash dataframe.sh 2>&1 | tee logs/df.log
bash gemm.sh 2>&1 | tee logs/ge.log
bash kv.sh 2>&1 | tee logs/kv.log
bash sn.sh 2>&1 | tee logs/sn.log
 