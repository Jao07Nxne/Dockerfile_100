#!/bin/bash

LOG_FILE="build_summary.log"
echo "=== Docker Build Benchmark Test ===" > $LOG_FILE
echo "Started at: $(date)" >> $LOG_FILE
echo "-----------------------------------" >> $LOG_FILE

for i in {1..100}
do
    FILE_NAME="test_${i}.dockerfile"
    TAG_NAME="argus-test:file_${i}"
    
    echo "========================================"
    echo "Building: ${FILE_NAME} ..."
    echo "========================================"
    
    docker build --rm -f "$FILE_NAME" -t "$TAG_NAME" .
    
    if [ $? -eq 0 ]; then
        echo "✅ ${FILE_NAME}: BUILD SUCCESS" | tee -a $LOG_FILE
        
        echo "Cleaning up ${TAG_NAME}..."
        docker rmi "$TAG_NAME"
    else
        echo "❌ ${FILE_NAME}: BUILD FAILED" | tee -a $LOG_FILE
    fi
done

echo "-----------------------------------"
echo "Running final Docker system prune..."
docker system prune -f

echo "Done! Check output summary in: ${LOG_FILE}"