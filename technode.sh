#!/bin/bash
cd ./src/GAMMA

l1_dim=8
l2_dim=328
memcells=("SRAM")
technodes=("22nm" "14nm" "10nm" "7nm" "5nm")
subarray_sizes=(64)
num_pes=(64)

l1_size=$(($l1_dim*$l1_dim))
l2_size=$(($l2_dim*$l2_dim))

noc_bw=128000
offchip_bw=512000

epochs=1000

log_level=1

for cim_pe in "${num_pes[@]}"
do
    for subarray_size in "${subarray_sizes[@]}"
    do
        dig_pe=$(($cim_pe*$subarray_size*$subarray_size/8))
        baseline_model_file=param310p1B_cim_1
        cim_model_file=param310p1B_cim_${subarray_size}

        for memcell in "${memcells[@]}"
        do
            for technode in "${technodes[@]}"
            do
                cim_file=${memcell}_${technode}_${subarray_size}x${subarray_size}_L1_${l1_dim}_L2_${l2_dim}
                
                python main.py --fitness1 latency --fitness2 energy --epochs $epochs \
                            --num_pe $cim_pe --l1_size $l1_size --l2_size $l2_size --NocBW $noc_bw --offchipBW $offchip_bw \
                            --model $cim_model_file --log_level $log_level --use_cim --subarray_size $subarray_size --cim_stats_file $cim_file
            done
        done
    done
done

cd ../../