# 🚀 **Smart Packaging System** 📦

The **Smart Packaging System** is an automated conveyor belt solution designed to optimize the packaging process for factories producing magnetic products. By leveraging sensor-based automation, this system enhances efficiency and ensures safe operations. ⚙️✨

## 🌟 Features

1. **Automatic Product Counting** 🔢
   - Tracks the number of magnetic products on the conveyor belt using a Hall effect sensor. 🧲
   - Displays the count on a 7-segment display for real-time monitoring. 📊

2. **Conveyor Belt Control** 🚂
   - Stops the belt automatically once the product count reaches the maximum limit (5 products). 🚫

3. **Worker Proximity Detection** 👷‍♂️
   - Uses an IR sensor to detect if a worker is nearby. 🤖
   - Alerts workers to secure the package if no one is detected near the belt. ⚠️

4. **System Reset** 🔄
   - Provides a switch for workers to resume belt operation after packaging. 🔄
   - Resets the product count to zero for the next cycle. 🔄

## 🔄 System Workflow

1. The conveyor belt moves magnetic products and counts them using the Hall effect sensor. 🏗️
2. The real-time count is displayed on the 7-segment display. 📱
3. When the count reaches 5, the belt automatically stops. 🛑
4. The system checks for worker proximity using the IR sensor. 📡
   - If no worker is nearby, an alert is triggered. 🔔
5. Once the worker secures the package, they use a switch to resume operation and reset the count. 🔄

## 🖥️ Technology Stack

- **Sensors**: Hall effect sensor (product counting), IR sensor (worker detection). 🧲🔍
- **Display**: 7-segment display for product count. 🖥️
- **Control System**: FPGA-based logic for automation. ⚡
- **Motors**: PWM-controlled motors for conveyor belt operation. 🔄

## 🏭 Applications

- Factories requiring precise product packaging. 🏭
- Automated production lines with minimal manual intervention. 🛠️
- Industries prioritizing worker safety and operational efficiency. 💼

## 🤝 Contributors

- Jomana Mahmoud 👩‍💻  
- Yehia Rasheed 👨‍💻  
- Moustafa Mohamed 👨‍💻  
- Amr Osama Mohamed 👨‍💻  
- Rawan Hossam Kamal 👩‍💻  
- Nada Yasser 👩‍💻  

## 🏆 Acknowledgments

This project was proudly presented at the **2024 Embedded Systems Fair** and recognized for its innovative approach to factory automation. 🏅🎉

---

### 📬 Contact

For inquiries or collaboration opportunities, please reach out to us via:

- **Email**: jomanatantawy42@gmail.com 📧  
- **GitHub**: [JomanaMahmoud](https://github.com/JomanaMahmoud) 💻  
- **LinkedIn**: [Jomana Tantawy](https://www.linkedin.com/in/jomana-tantawy-b516b0315/) 🌐  

This project leverages an FPGA board for implementing control logic and ensuring precise automation. 🖥️🎯

---

## 🏁 How to Run on Quartus

To get your **Smart Packaging System** up and running on **Quartus** (the FPGA development environment), follow these simple steps:

### 1. **Install Quartus** 💻
   - Download and install the **Quartus Prime** software from the [Intel website](https://www.intel.com/content/www/us/en/programmable/downloads/download-center.html). Choose the appropriate version for your operating system.

### 2. **Create a New Project** 🛠️
   - Open **Quartus** and click on **File > New Project Wizard**.
   - Follow the on-screen instructions to create a new project. Select the FPGA device you're working with (e.g., **Cyclone IV**).

### 3. **Add Your Files** 📂
   - Add the necessary **VHDL** or **Verilog** files for your control logic. These files implement the automation logic for the conveyor belt and sensors.
   - You can also add any **constraint files** for setting pin assignments based on your FPGA board.

### 4. **Compile Your Project** 🏗️
   - Click on **Processing > Start Compilation** to compile your project. Make sure there are no errors in the output.

### 5. **Program the FPGA** 🔌
   - Connect your FPGA board to your computer via the USB-Blaster programmer.
   - Click on **Tools > Programmer** and select your FPGA device.
   - Click on **Start** to upload the compiled design to your FPGA.

### 6. **Test the System** 🧪
   - Once the FPGA is programmed, observe the **conveyor belt**, **7-segment display**, and **sensors**. The system should now be fully operational, with the product count, belt control, and worker detection functioning automatically.
