#!/bin/bash

/bin/ollama serve &

pid=$!

sleep 5


echo "Retrieve tinyllama model..."
ollama pull tinyllama 
echo "Done"

wait $pid