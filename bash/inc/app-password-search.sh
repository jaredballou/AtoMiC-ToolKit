#!/bin/bash
echo
sleep 1
echo -e "${YELLOW}--->Finding $APPTITLE WebUI password...$ENDCOLOR"
if [ "$PASSSEARCH" == "NA" ] || [ "$APPSETTINGS" == "NA" ]; then
    echo -e 'Incompatibility. Cannot determine password.'
else
    UIPASSSTRING=$(grep "$PASSSEARCH" $APPSETTINGS | head -1)
    UIPASS=${UIPASSSTRING##*$PASSSEARCH}

    if [ "$PASSSEARCH" != "NA" ] && [ "$APPNEWPASS" == "atomic" ]; then
        UIPASS=$(echo "$UIPASS" | tr -dc '[:alnum:]')
    fi

    if [ ! -z "$UIPASS" ]; then
        echo -e 'Password found.';
        UIPASSSTATUS="Set"
    else
        echo -e 'No password found.';
        UIPASSSTATUS=""
        if [ -z "$UIPASSSTATUS" ] && [ ! -z "$APPDEFAULTPASS" ]; then
            echo -e "Try default password: $GREEN$APPDEFAULTPASS$ENDCOLOR"
        fi
    fi
fi
