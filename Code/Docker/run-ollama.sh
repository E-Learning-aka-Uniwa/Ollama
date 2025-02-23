#!/bin/bash

/bin/ollama serve &

pid=$!

sleep 5


echo "Retrieve phi3 model..."
ollama pull phi3 
echo "Done"

wait $pid