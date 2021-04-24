#!/bin/bash
FILE=access.log.1
if [[ ! -f ${FILE} ]] ;
then
        echo "Error: $FILE not in current directory"
            echo "cd to current apache dir"
                exit 1
            fi

            echo "Total entry count" $(/bin/cat access.log.1 | grep -v server-status| /usr/bin/wc -l)
            echo ""
            echo "Popular endpoints"
            /bin/cat access.log.1 | grep -v server-status| /usr/bin/awk '{print $7}'  | /usr/bin/sort | /usr/bin/uniq -c | /usr/bin/sort -r
            echo ""
            echo "Status Code Count"
            /bin/cat access.log.1 | grep -v server-status| /usr/bin/awk '{print $9}'  | /usr/bin/sort | /usr/bin/uniq -c | /usr/bin/sort -r
            echo ""
            echo "Referring Websites"
            /bin/cat access.log.1 | grep -v server-status| /usr/bin/awk '{print $11}'  | /usr/bin/sort | /usr/bin/uniq -c | /usr/bin/sort -r
