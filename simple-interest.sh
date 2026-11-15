#!/bin/bash

# Simple Interest Calculator

read -r -p "Enter principal amount: " principal
read -r -p "Enter annual interest rate (%): " rate
read -r -p "Enter time in years: " time

for value in "$principal" "$rate" "$time"; do
    if ! [[ "$value" =~ ^[0-9]+([.][0-9]+)?$ ]]; then
        echo "Error: enter a valid non-negative number."
        exit 1
    fi
done

awk -v p="$principal" -v r="$rate" -v t="$time" 'BEGIN {
    interest = (p * r * t) / 100
    printf "Simple Interest: %.2f\n", interest
    printf "Total Amount: %.2f\n", p + interest
}'
