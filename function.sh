#!/bin/bash
#display and time
function ddat()
{
	echo "Today is $(date +%Y-%m-%d)."
	echo "Current time：$(date +%H:%M:%S)"
	NOW=`date +%a`
	case $NOW in
	Mon|Tue|Wed|Thu|Fri) echo "because today is $NOW,we need to work"
	;;
	Sat|Sun) echo "Because today is $NOW,we can have a rest"
	;;
	esac
}

function pl2048()
{
	aim0="~/home/wa/2048.c"
	aim1="~/2048"
	#gcc $aim0
	#$aim1
	~/2048
}
function cal()
{
	echo "this is a cal program"
	gcc cal.c
	./a.out
}
function createPass()
{
	echo -n "pass:$1" >>Account.txt #带-n就是说末尾没有换行符
}
function createName()
{
	echo  "name://$1" >>Account.txt #不带-n就是说末尾有换行符
}

#账户登录部分
function1()
{
echo "please input your account😚"
declare -i cal=0
read account 
#if account 没能被找到，显示不存在此账户
while read  line
do
	if [[ $line =~ [a-z]+[:]+$account[a-z]+ ]]
		then echo "the account exists"
		cal=1
		break
	fi
done <Account.txt
if [[ "$cal" -eq 0 ]]
	then echo "sorry your account doesn't exist"
	exit 1
else
	read -sp  "please enter corresponding password"  password
	echo ""
	if [[ $line =~ [p]+[a]+[s]+[:]+$password[n]+[a] ]]
		then echo ":),no question."
	line1=$line
	
	else
		echo ":),sorry,your answer is false"
		exit 2
	fi
fi

	#账户登录以后的主菜单模块
while :
do 
	clear
echo ":)hello${line1#*//}-----------------"
echo "===================================="
echo "		MAIN-MENU	        "
echo "===================================="
echo "1.display date and time."
echo "2.display system and information"
echo "3.display reminder"
echo "4.write reminder"
echo "5.bakeup"
echo "6.exit"

read -p "Enter your choice[1-4]:" choice 
case $choice in
1)
	ddat
	read -p "Press any key to continue..." readEnterKey
;;
2)
	uname -a #打印系统信息
	read -p "Press any key to continue..." readEnterKey
;;
3)
	mkdir -p /home/wa/Desktop/shell/shellStore/User/${line1#*//}
	touch /home/wa/Desktop/shell/shellStore/User/${line1#*//}/reminder.txt
	echo "/home/wa/Desktop/shell/shellStore/User/${line1#*//}/reminder.txt"
	cat /home/wa/Desktop/shell/shellStore/User/${line1#*//}/reminder.txt
	read -p "Press any key to continue..." readEnterKey
;;
4)
	mkdir -p /home/wa/Desktop/shell/shellStore/User/${line1#*//}
	touch /home/wa/Desktop/shell/shellStore/User/${line1#*//}/reminder.txt
	echo "/home/wa/Desktop/shell/shellStore/User/${line1#*//}/reminder.txt"
	vi /home/wa/Desktop/shell/shellStore/User/${line1#*//}/reminder.txt
	read -p "Press any key to continue..." readEnterKey
;;
5)
	# bak
	BAK=/home/wa/Desktop/shell/shellStore/User/${line1#*//}
	DES=/home/wa/Desktop/shell/shelltest/User/${line1#*//}
	echo trying to backup ${BAK} to des ${DES}
	# BAK不存在的话就echo下面的内容
	#[! -d $BAK] && {echo Source backup directory $BAK not found.;exit 1;}
	# DES不存在的话就echo下面的内容
	#[! -b $DES] && {echo Destination directory $DES not found.;exit 2;}
#modify
	if [ ! -d $BAK ];then
		mkdir -p $BAK
	fi
	if [ ! -d $DES ];then
		mkdir -p $DES
	fi
	cp ${BAK}/* $DES  #cp:自复制and他复制
	read -p "Press any key to continue..." readEnterKey
;;
6)
	echo "Bye!"
	exit 0
;;
*)
	echo "Error: Invalid option!"
	read -p "Press any key to continue..." readEnterKey
esac
done

}

#账户注册部分
function2()
{
	read -p "please your account:（it is expected of consisting of numbers obsolutely）" account
	flag=0
	#如果合法（不和文件中已有账号重复并且是纯数字）就追加\nid:$account
	#如果和已有账号重复，输出信息
	#如果不是纯数字，输出信息
	while read line
	do 
		line=${line##*id:} # 截断该怎么截呢？
		line=${line%%pass:*}
		if [[ $account =~ $line ]] 
		then echo "has existed"
		flag=1
		exit 1

		elif [[ !($account =~ ^[0-9]+$) ]]	# 这样的语法有问题吗？
		then echo "the account should consist of numbers absolutely"
		flag=1
		exit 1
		fi
	#	echo "$account 不匹配 $line,it is good"
	done <Account.txt

	if [ "$flag" -eq 0 ]
	then
		#调用创建账户的函数(在文件后追加id:$account)
		echo "you create the account successfully"
		echo -n ""id:$account"" >>Account.txt
		#调用创建密码的函数(在文件后追加pass:$read)
		read -p "input your password" pass
		createPass $pass
		#调用创建名字的函数(在文件后追加id:$read)
		read -p "input your name" name
		createName $name
	fi
}
#nothing, 游客服务程序
function3()
{
	echo "Thank you visiting here ,we will still offer you some basic service!"
	echo "1.display date and time"
	echo "2.calculate "
	echo "3.play 2048"
	echo "4.exit"

	read -p "Enter your choice[1-4]:" choice 
	case $choice in
	1)
		ddat
#		echo "Today is $(date +%Y-%m-%d)."
#		echo "Current time：$(date +%H:%M:%S)"
		read -p "Press any key to continue..." readEnterKey
	;;
	2)
		cal
		read -p "Press any key to continue..." readEnterKey
	;;
	3)
		pl2048
	;;
	4)
		echo "Bye!"
		exit 0
	;;
	*)
		echo "Error: Invalid option!"
		read -p "Press any key to continue..." readEnterKey
	esac
}
