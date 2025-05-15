SMTP_SERVER=${SMTP_SERVER:-"smtps://smtp.gmail.com:465"}
SMTP_USER=${SMTP_USER:-"username@gmail.com"}
SMTP_PASSWORD=${SMTP_PASSWORD:-"secret"}
SMTP_FROM=${SMTP_FROM:-"from@mail.com"}
SMTP_TO=${SMTP_TO:-"to@mail.com"}

THRESHOLD=85
usage=$(df --output=pcent / | awk 'NR==2 {sub(/%/, "", $1); print $1}')

if [ $usage -ge $THRESHOLD ]; then
    email_content=$(cat <<EOF
        From: ${SMTP_FROM}
        To: ${SMTP_TO}
        Subject: Disk Usage Alert
        Content-Type: text/plain; charset="UTF-8"

        Disk usage on server is ${usage}% (threshold: ${THRESHOLD}%).
        Please clean up the storage!
EOF
)

    echo "$email_content" | curl --ssl-reqd \
        --url "${SMTP_SERVER}" \
        --user "${SMTP_USER}:${SMTP_PASSWORD}" \
        --mail-from "${SMTP_FROM}" \
        --mail-rcpt "${SMTP_TO}" \
        -T - 
fi