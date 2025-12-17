% Image-Based Encryption and Decryption System
% Supports uppercase and lowercase letters
% Uses image pixel values and date-based offset for dynamic key generation

clc;
clear;
close all;

image = 'KeyImage.jpg'; 
img = imread(image);
gray = rgb2gray(img);

plaintext = input('Enter the message to encrypt: ', 's');

date_str = datestr(now, 'yyyymmdd');      
date_digits = double(date_str) - 48;      

pixels = double(gray(:)); 
key_stream = pixels(1:10:length(plaintext)*10);  
key_stream = key_stream(:).';                     

date_digits_full = repmat(date_digits, 1, ceil(length(key_stream)/length(date_digits)));
date_digits_full = date_digits_full(1:length(key_stream));

key_stream = key_stream + date_digits_full;
key_stream = mod(key_stream, 26);

% ---------------- ENCRYPTION ----------------
ciphertext = plaintext;
key_index = 1;

for i = 1:length(plaintext)
    ch = plaintext(i);

    % Uppercase letters
    if ch >= 'A' && ch <= 'Z'
        plain_val = double(ch) - 65;
        cipher_val = mod(plain_val + key_stream(key_index), 26);
        ciphertext(i) = char(cipher_val + 65);
        key_index = key_index + 1;

    % Lowercase letters
    elseif ch >= 'a' && ch <= 'z'
        plain_val = double(ch) - 97;
        cipher_val = mod(plain_val + key_stream(key_index), 26);
        ciphertext(i) = char(cipher_val + 97);
        key_index = key_index + 1;

    % Non-alphabetic characters
    else
        ciphertext(i) = ch;
    end
end

disp('--- ENCRYPTION COMPLETE ---');
disp(['Ciphertext: ', ciphertext]);

% ---------------- DECRYPTION ----------------
recovered_text = ciphertext;
key_index = 1;

for i = 1:length(ciphertext)
    ch = ciphertext(i);

    % Uppercase letters
    if ch >= 'A' && ch <= 'Z'
        cipher_val = double(ch) - 65;
        plain_val = mod(cipher_val - key_stream(key_index), 26);
        recovered_text(i) = char(plain_val + 65);
        key_index = key_index + 1;

    % Lowercase letters
    elseif ch >= 'a' && ch <= 'z'
        cipher_val = double(ch) - 97;
        plain_val = mod(cipher_val - key_stream(key_index), 26);
        recovered_text(i) = char(plain_val + 97);
        key_index = key_index + 1;

    % Non-alphabetic characters
    else
        recovered_text(i) = ch;
    end
end

disp('--- DECRYPTION COMPLETE ---');
disp(['Decrypted Text: ', recovered_text]);

if strcmp(plaintext, recovered_text)
    disp('✅ Decryption Successful! Message recovered correctly.');
else
    disp('❌ Decryption Failed! Check key or image.');
end