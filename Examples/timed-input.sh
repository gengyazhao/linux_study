#!/bin/bash
#timed-input.sh

#TMOUT

TIMELIMIT=3

PrintAnswer()
{
        if [ "$answer" = TIMEOUT ];then
                echo $answer
        else
                echo "Your favorite veggie is $answer"
                kill $! #kill 将不再需要TimerOn函数运行在后台。
                        #$!是运行在后台的最后一个工作的PID
        fi
}

TimerOn()
{       #等待3秒，然后发送一个信号给脚本。
        sleep $TIMELIMIT && kill -s 14 $$ &
}

Int14Vector()
{
        answer="TIMEOUT"
        PrintAnswer
        exit 14
}

#屏蔽该函数发出的超时中断信号
trap Int14Vector 14     #时间中断(14)被破坏了

echo "What is your favorite vegetable?"
TimerOn
read answer
PrintAnswer
#使用read -t 选项来实现这个任务会更简化
exit 0
