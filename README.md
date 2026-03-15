# AI-Based Electrical Fault Detection System

A machine learning-based system for detecting electrical faults using MATLAB and Neural Networks.  
The project analyzes electrical parameters such as voltage, current, temperature, power factor, and frequency to classify possible faults in electrical systems.

---

## Project Overview

Electrical systems can experience faults such as voltage fluctuations, overload conditions, or thermal issues.  
Traditional monitoring methods often rely on manual inspection or fixed thresholds, which may fail to detect complex fault patterns.

This project implements an **AI-based fault detection system** that uses a neural network model trained on electrical parameter data.  
The trained model is integrated into a **MATLAB App Designer interface** to allow users to input system parameters and detect faults in real time.

---

## Features

- Machine learning-based fault classification
- MATLAB App Designer graphical interface
- Real-time fault detection
- Fault description display
- Fault history logging
- Export functionality for recorded faults

---

## Dataset

The model is trained using a custom dataset containing electrical system parameters.

### Input Features

- Voltage (V)
- Current (A)
- Power Factor (Cosφ)
- Temperature (°C)
- Frequency (Hz)

### Output Classes

- Normal
- Voltage Fluctuation
- Power Factor Issue
- Thermal Overload
- Overload Fault

The dataset contains **1200 samples** generated using realistic operating ranges for electrical systems.

---

## Machine Learning Model

The system uses a **Pattern Recognition Neural Network** implemented in MATLAB.

### Model Configuration

- Input Features: 5
- Hidden Layer: 12 neurons
- Training Algorithm: Levenberg-Marquardt (`trainlm`)
- Performance Function: Cross-Entropy
- Data Split: 70% training, 30% testing

### Preprocessing Steps

1. Load dataset from CSV file
2. Remove missing values
3. Normalize input features using Min-Max scaling
4. Convert fault labels to one-hot encoding
5. Train neural network model

## MATLAB Application Interface

The project includes a MATLAB App Designer interface with three main tabs:

### Home Tab

Provides system overview and navigation options.

Functions include:

- User guide
- Access to fault detection module
- Display of normal operating ranges
- Navigation to fault history

---

### Fault Detection Tab

Users can input electrical parameters:

- Voltage
- Current
- Temperature
- Power Factor
- Frequency

After clicking **Detect Fault**, the system:

1. Normalizes input values
2. Passes them to the trained neural network
3. Predicts the fault type
4. Displays fault status and description

---

### Fault History Tab

Stores previous predictions.

Displayed information:

- Voltage
- Current
- Power Factor
- Temperature
- Frequency
- Detected Fault

Additional features:

- Clear history
- Export results

---
## Project Structure


AI-Fault-Detection-System
│
├── trainModel.m
├── FaultDetectionApp.mlapp
├── data.csv
├── FaultDetectionNN.mat
│
├── screenshots
│   ├── home_tab.png
│   ├── fault_detection_tab.png
│   └── fault_history_tab.png
│
└── README.md

---

## System Workflow

Electrical Parameters
        │
        ▼
Dataset (CSV)
        │
        ▼
Data Preprocessing
        │
        ▼
Neural Network Training
        │
        ▼
Saved Model (.mat)
        │
        ▼
MATLAB App Interface
        │
        ▼
Fault Prediction

---

## Demo

Demo video:  
(Add Google Drive link here)
