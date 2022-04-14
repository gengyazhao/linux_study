[root@linux]$ cat ./Example9-7.1.sh
#!/bin/bash
#在shift命令后边，$@将保存命令行中剩余的参数，而$1被丢掉了。
#使用./scriptname 1 2 3 4 5来调用这个脚本
echo "$@" # 1 2 3 4 5
shift
echo "$@" # 2 3 4 5
shift
echo "$@" # 3 4 5
exit 0
[root@linux]$ ./Example9-7.1.sh 1 2 3 4 5
1 2 3 4 5
2 3 4 5
3 4 5
