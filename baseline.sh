cd ./src/GAMMA
python main.py --fitness1 latency --fitness2 energy --epochs 150 \
               --num_pe -1 --l1_size 4096 --l2_size 1048576 --NocBW 128000 --offchipBW 512000 --pe_limit 32768 \
               --model param310p1B_cim_1 --log_level 2
cd ../../
