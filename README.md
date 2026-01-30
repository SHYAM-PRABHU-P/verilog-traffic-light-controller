# 🚦 Traffic Light Controller using Verilog

## 📌 Project Overview
This project implements a **Traffic Light Controller** using **Verilog HDL**.  
The controller operates based on a **Finite State Machine (FSM)** to manage traffic signals efficiently.

## 🎯 Features
- FSM-based design
- Configurable timing for RED, YELLOW, and GREEN signals
- Synchronous design
- Separate testbench for verification
- Simulation waveform included

## 🧠 Design Approach
- States: RED → GREEN → YELLOW
- State transitions controlled by clock and reset
- Outputs depend on the current state

## 🗂️ Folder Structure
  src/ - Verilog RTL code
  tb/ - Testbench
  sim/ - Simulation results
  docs/ - State diagram & timing diagram

## 🔧 Tools Used
- Verilog HDL
- Xilinx Vivado / ModelSim (or your tool)
- GTKWave (for waveform analysis)

## ▶️ How to Simulate
1. Compile RTL and testbench
2. Run simulation
3. View waveform using GTKWave or Vivado

## 📸 Outputs
- State diagram
- Simulation waveform

## 🚀 Future Enhancements
- Pedestrian crossing support
- Emergency vehicle priority
- Multi-road intersection control

## 👤 Author
**Shyam Prabhu P**
