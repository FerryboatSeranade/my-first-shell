#!/bin/bash

#在shellStore目录下加载函数文件
. /home/wa/Desktop/shell/shellStore/function.sh
#main
echo this is my bash.
echo "i want test for."
#test for
for((i = 0; i < 3; i++))
do
	for(( j = 0; j < 5; j++ ))
	do
		echo -n "* "
	done
	echo ""
done
sleep 3

#进入正题
while : 
do
clear #清屏

echo "what do you want to do?"
echo "1.login"
echo "2.registe"
echo "3.nothing，just lounging around"
echo "4.exit"
read -p "Enter your choice[1-4]:" choice 
case $choice in
1)
	function1  #调用函数1
	read -p "Press any key to continue..." readEnterKey
;;
2)
	function2  #调用函数2
	read -p "Press any key to continue..." readEnterKey
;;
3)
	function3  #调用函数3
	read -p "Press any key to continue..." readEnterKey
;;
4)
	echo "Bye!"
	exit 0
;;
*)
	echo "Error: Invalid option!"
	read -p "Press any key to continue..." readEnterKey
esac
done

# 一下是学习、测试代码，和上述内容无关.
#test 嵌套的 if-else
declare -i count
read -p "Enter an count:" count
if [ $count -eq 100 ]
then echo "count is 100"
else if [ $count -gt 100 ]
	then echo "count is greater than 100"
	else echo "count is less than 100"
	fi
fi

#test logic or ||
date +%a
NOW=$(date +%a )  #在shell中空格都要十分注意   命令执行结果赋值给变量的两种方法：$();``(这是剑豪而非单引号)
if [[ "$NOW" = "Mon"  ||  "$NOW" = "Tue" ||  "$NOW" = "Thu"  ||  "$NOW" = "Wed" ||  "$NOW" = "Fri" ]] #感觉[[ ]]更实用
then echo ":(,今天得上课"
else echo ":)今天放假呀"
fi





	
