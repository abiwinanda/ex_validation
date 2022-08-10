curl -X POST "http://localhost:4000/api/user/1/todo" \
    -H "Content-Type:application/json" \
    --data-raw '{"title": "Learn guitar", "description": "Pentatonic scale deep dive", "deadline": "2050-10-10T10:10:10Z"}'
    