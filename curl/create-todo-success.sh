curl -X POST "http://localhost:4000/api/todo" \
    -H "Content-Type:application/json" \
    --data-raw '{"todo": {"user_id": 1, "title": "Learn guitar", "description": "Pentatonic scale deep dive", "deadline": "2050-10-10T10:10:10Z"}}'
    