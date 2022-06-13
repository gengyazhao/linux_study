awk是一种处理文本文件的语言，是一个强大的文本分析工具。
语法
awk [选项参数] 'script' var=value file(s)
或
awk [选项参数] -f scriptfile var=value file(s)

log.txt文本内容如下：

2 this is a test
3 Do you like awk
This's a test
10 There are orange,apple,mongo

用法一：
awk '{[pattern] action}' {filenames}
awk '{print $1,$4}' log.txt
#每行按空格或TAB分割，输出每一行的第一列，第四列
---------------------------------------------
 2 a
 3 like
 This's
 10 orange,apple,mongo
 
 #格式化输出
 awk '{printf "%-8s %-10s\n",$1,$4}' log.txt
 ---------------------------------------------
 2        a
 3        like
 This's
 10       orange,apple,mongo
 
 
 用法二：
awk -F  #-F相当于内置变量FS, 指定分割字符
# 使用","分割
 $  awk -F, '{print $1,$2}'   log.txt
 ---------------------------------------------
 2 this is a test
 3 Do you like awk
 This's a test
 10 There are orange apple
 # 或者使用内建变量
 $ awk 'BEGIN{FS=","} {print $1,$2}'     log.txt
 ---------------------------------------------
 2 this is a test
 3 Do you like awk
 This's a test
 10 There are orange apple
 
 # 使用多个分隔符.先使用空格分割，然后对分割结果再使用","分割
 $ awk -F '[ ,]'  '{print $1,$2,$5}'   log.txt
 ---------------------------------------------
 2 this test
 3 Are awk
 This's a
 10 There apple
 
 用法三：

awk -v  # 设置变量
$ awk -va=1 '{print $1,$1+a}' log.txt
 ---------------------------------------------
 2 3
 3 4
 This's 1
 10 11
$ awk -va=1 -vb=s '{print $1,$1+a,$1b}' log.txt
 ---------------------------------------------
 2 3 2s
 3 4 3s
 This's 1 This'ss
 10 11 10s
 
用法四：

awk -f {awk脚本} {文件名}
$ awk -f cal.awk log.txt

过滤第一列大于2的行
$ awk '$1>2' log.txt
---------------------------------------------
3 Do you like awk
This's a test
10 There are orange,apple,mongo

过滤第一列等于2的行
$ awk '$1==2 {print $1,$3}' log.txt    #命令
---------------------------------------------
2 is

过滤第一列大于2并且第二列等于'Are'的行
$ awk '$1>2 && $2=="Are" {print $1,$2,$3}' log.txt    #命令
---------------------------------------------
3 Are you

内建变量
$n	当前记录的第n个字段，字段间由FS分隔
$0	完整的输入记录
FILENAME	当前文件名
FNR	各文件分别计数的行号
FS	字段分隔符(默认是任何空格)
IGNORECASE	如果为真，则进行忽略大小写的匹配
NF	一条记录的字段的数目
NR	已经读出的记录数，就是行号，从1开始





awk脚本
关于 awk 脚本，我们需要注意两个关键词 BEGIN 和 END。
BEGIN{ 这里面放的是执行前的语句 }
END {这里面放的是处理完所有的行后要执行的语句 }
{这里面放的是处理每一行时要执行的语句}
