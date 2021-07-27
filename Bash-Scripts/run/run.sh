echo "Trying to compile and execute: $1";
file=$1
filename=${file%.*}
extension=${file##*.}
echo "The filename is: $filename";
echo "The extension is: $extension";
case $extension in

	py)
		python3 $file
		;;
	java)
		javac $file && java $filename
		;;
	c)
		gcc $file -o $filename && ./$filename
		;;
	cpp)
		g++ $file -o $filename && ./$filename
		;;
	js)
		node $file
		;;
	kt)
		kotlinc $file -include-runtime -d $filename.jar && java -jar $filename.jar
		;;
	txt)
		nano $file
		;;
	sh)
		chmod +x $file
		./$file
		;;
	*)
		echo "$extension is unsupported."
		;; 
esac
