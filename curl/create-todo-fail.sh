curl -X POST "http://localhost:4000/api/user/1/todo" \
    -H "Content-Type:application/json" \
    --data-raw '{"description": "Invalid todo", "deadline": "1000-10-10T10:10:10Z"}'
    