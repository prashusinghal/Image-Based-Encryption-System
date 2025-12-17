🔐 Image-Based Encryption System (MATLAB)

This project implements an image-based encryption and decryption system using MATLAB.
The encryption key is dynamically generated from image pixel intensity values, combined with a date-based offset, ensuring that encrypting the same message on different days produces different ciphertexts.

The system demonstrates practical applications of cryptography and image processing, with a focus on secure key generation and reversible encryption logic.

🚀 Key Features

Dynamic key generation using image pixel values

Date-based offset to enhance encryption variability

Supports both uppercase and lowercase letters

Preserves numbers, spaces, and special characters

Accurate decryption with complete plaintext recovery

🧠 Concepts Used

Cryptography fundamentals

Image processing in MATLAB

Dynamic keystream generation

Modular arithmetic

Secure message transformation

📂 Project Structure

encryption_decryption.m  → Main MATLAB code

KeyImage.jpg             → Key image used for key generation

README.md                → Project documentation

▶️ How to Run

Place encryption_decryption.m and KeyImage.jpg in the same directory

Open MATLAB and navigate to the project folder

Run the following command:

encryption_decryption

Enter the plaintext message when prompted

⭐ Future Enhancements

Stronger cryptographic algorithms

GUI using MATLAB App Designer

Improved key entropy and randomness

Support for extended character sets
