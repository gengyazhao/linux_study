#!/bin/bash
#Funtion:根据用户输入的PID，过滤出该PID所有的信息
#读取键盘输入的PID,存储到变量pid中
read -p "请输入要查询的PID：" pid
#ps -aux显示当前所有进程
#第二列中包含pid，并且从^开头匹配，匹配到$结尾，匹配条件的列显示第十一列
#wc -l只统计行数，即行数赋值给n
n=`ps -aux | awk '$2~/^'$pid'$/{print $11}'|wc -l`
if [ $n -eq 0 ];then
	echo "该PID不存在！！"
	exit
fi
echo "---------------------------------------"
echo "进程PID:$pid"
echo "进程命令：`ps -aux | awk '$2~/^'$pid'$/{print $11}'`"
echo "进程所属用户：`ps -aux | awk '$2~/^'$pid'$/{print $1}'`"
echo "进程CPU占用率：`ps -aux | awk '$2~/^'$pid'$/{print $3}'`"
echo "进程内存占用率：`ps -aux | awk '$2~/^'$pid'$/{print $4}'`"
echo "进程开始运行的时刻：`ps -aux | awk '$2~/^'$pid'$/{print $9}'`"
echo "进程运行的时间：`ps -aux | awk '$2~/^'$pid'$/{print $10}'`"
echo "进程状态：`ps -aux | awk '$2~/^'$pid'$/{print $8}'`"
echo "进程虚拟内存：`ps -aux | awk '$2~/^'$pid'$/{print $5}'`"
echo "进程共享内存：`ps -aux | awk '$2~/^'$pid'$/{print $6}'`"
echo "---------------------------------------"
