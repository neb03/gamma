cd ./src/GAMMA
python main.py --fitness1 latency --fitness2 energy --epochs 250 \
               --num_pe 64 --l1_size 4096 --l2_size 1048576 --NocBW 128000 --offchipBW 512000 \
               --model param310p1B_cim_64 --log_level 1 --use_cim --subarray_size 64 --cim_stats_file SRAM_22nm_64x64_L1_32_L2_1024
#--use_cim --subarray_size 32 --cim_stats_file SRAM_22nm_32x32_L1_32_L2_1024
cd ../../
