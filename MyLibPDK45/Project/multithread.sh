#!/bin/bash
MAX_THREADS=4
LOG_DIR="sram_sim_logs"
mkdir -p $LOG_DIR
if [[ ! -p my_pipe ]]; then
    mkfifo my_pipe
fi
exec 3<>my_pipe
for ((i=1; i<=MAX_THREADS; i++))
do
    echo >&3
done
run_sram_sim() {
    local thread_id=$1
    local log_file="$LOG_DIR/sram_sim_${thread_id}.log"
    echo "线程 ${thread_id} 开始执行 make sram_sim"
    make sram_sim > ${log_file} 2>&1
    if [ $? -eq 0 ]; then
        echo "线程 ${thread_id} 执行成功"
    else
        echo "线程 ${thread_id} 执行失败"
    fi
}
start_time=$(date +%s)
for ((i=1; i<=8; i++))
do
    read -u 3
    {
        run_sram_sim $i
        echo >&3
    } &
done
wait
end_time=$(date +%s)
duration=$((end_time - start_time))
exec 3>&-
rm my_pipe
echo "所有任务执行完成！"
echo "总执行时间: ${duration} 秒"
echo "日志文件位置: ${LOG_DIR}/"