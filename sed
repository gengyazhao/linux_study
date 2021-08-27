功能说明：利用script来处理文本文件。

语　　法：sed [-hnV][-e<script>][-f<script文件>][文本文件]

补充说明：sed可依照script的指令，来处理、编辑文本文件。

参　　数：
  -e<script>或--expression=<script>   以选项中指定的script来处理输入的文本文件。
  -f<script文件>或--file=<script文件>  以选项中指定的script文件来处理输入的文本文件。
  -h或--help   显示帮助。
  -n或--quiet或--silent   仅显示script处理后的结果。
  -V或--version   显示版本信息。
