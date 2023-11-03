#TODO: add multi gpu support
data_array=($(nvidia-smi --id=0 --query-gpu=utilization.gpu,utilization.memory,memory.used,memory.total,temperature.gpu,power.draw --format=csv,nounits,noheader | tr ",", "\n"))
echo "gpu_percent_used|range:0-100|${data_array[0]}"
echo "mem_percent_used|range:0-100|${data_array[1]}"
echo "mem_used|int|${data_array[2]}"
echo "mem_total|int|${data_array[3]}"
echo "gpu_temp|int|${data_array[4]}"
echo "powerdraw|float|${data_array[5]}"
echo ""
