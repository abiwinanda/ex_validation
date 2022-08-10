curl -X POST "http://localhost:4000/api/todo" \
    -H "Content-Type:application/json" \
    --data-raw '{"todo": {"description": "Invalid todo", "deadline": "1000-10-10T10:10:10Z"}}'
    