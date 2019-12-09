#!/bin/sh

OUTPUT_DIR=formatted
HEADER_COLUMN_NAME="日時"
SEP="	"
SEP_NEW=
FILE_NAME_SEP="_"

##### MAIN ######

mkdir -p $OUTPUT_DIR

FILE=$1

FILE_NAME=`basename $FILE`
FILE_NAME_DATE=`echo $FILE_NAME | sed -E "s/^.*_([0-9]+)\.tsv$/\1/"`

#echo $FILE_NAME_DATE
FORMATED_DATE=`date -j -f "%Y%m%d" "$FILE_NAME_DATE" "+%Y/%m/%d"`
#echo $FORMATED_DATE


isFirst=0
(
for line in `sed -e "s/$SEP/$SEP_NEW/g" $FILE`
do
	addColumn=""
	if [ $isFirst = 0 ]; then
		addColumn=$HEADER_COLUMN_NAME
		isFirst=1
	else
		addColumn=$FORMATED_DATE
		
	fi

	newLine="${line}${SEP_NEW}$addColumn"
	echo $newLine | sed -e "s/$SEP_NEW/$SEP/g"
done
) > ./$OUTPUT_DIR/$FILE

echo add date column done. ./$OUTPUT_DIR/$FILE 
exit 0
