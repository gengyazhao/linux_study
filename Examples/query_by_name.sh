#!/bin/bash
#Funtion:根据输入的程序的名字过滤出所对应的PID，并显示出详细信息，如果有多个PID，则全部显示
#读取键盘输入的进程名,存储到变量NAME中
read -p "请输入要查询的进程名：" NAME
#ps -aux显示当前所有进程
#wc -l只统计行数，即行数赋值给N
#统计进程总数
N=`ps -aux |grep $NAME | grep -v grep |wc -l`
#-le 小于等于
if [ $N -le 0 ];then
	echo "该进程名没有运行！！"
	exit
fi
i=1
#-gt 大于
while [ $N -gt 0 ]
do
	echo "---------------------------------------"
	#ps -aux | grep $NAME 过滤出包含NAME的行
	#grep $NAME | grep -v grep	grep $NAME会产生一个包含grep的查找的进程，grep -v grep反向查找，查找不包含grep的行
	#awk NR已经读出的记录数，就是行号，从1开始
	echo "进程PID:`ps -aux | grep $NAME | grep -v grep | awk 'NR=='$i'{print $0}' | awk '{print $2}'`"
	echo "进程命令：`ps -aux | grep $NAME | grep -v grep | awk 'NR=='$i'{print $0}' | awk '{print $11}'`"
	echo "进程所属用户：`ps -aux | grep $NAME | grep -v grep | awk 'NR=='$i'{print $0}' | awk '{print $1}'`"
	echo "进程CPU占用率：`ps -aux | grep $NAME | grep -v grep | awk 'NR=='$i'{print $0}' | awk '{print $3}'`"
	echo "进程内存占用率：`ps -aux | grep $NAME | grep -v grep | awk 'NR=='$i'{print $0}' | awk '{print $4}'`"
	echo "进程开始运行的时刻：`ps -aux | grep $NAME | grep -v grep | awk 'NR=='$i'{print $0}' | awk '{print $9}'`"
	echo "进程运行的时间：`ps -aux | grep $NAME | grep -v grep | awk 'NR=='$i'{print $0}' | awk '{print $11}'`"
	echo "进程状态：`ps -aux | grep $NAME | grep -v grep | awk 'NR=='$i'{print $0}' | awk '{print $8}'`"
	echo "进程虚拟内存：`ps -aux | grep $NAME | grep -v grep | awk 'NR=='$i'{print $0}' | awk '{print $5}'`"
	echo "进程共享内存：`ps -aux | grep $NAME | grep -v grep | awk 'NR=='$i'{print $0}' | awk '{print $6}'`"
	echo "---------------------------------------"
	let N-- i++
done
