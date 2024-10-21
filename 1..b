import java.util.Scanner;

public class MonoalphabeticCipher {

    public static void main(String[] args) {
        String alphabet = "abcdefghijklmnopqrstuvwxyz";
        String key = "zyxwvutsrqponmlkjihgfedcba"; // Example substitution key

        Scanner sc = new Scanner(System.in);
        System.out.println("Enter the plain text: ");
        String plaintext = sc.nextLine();

        String ciphertext = encrypt(plaintext, alphabet, key);
        System.out.println("Encrypted text: " + ciphertext);

        String decryptedText = decrypt(ciphertext, alphabet, key);
        System.out.println("Decrypted text: " + decryptedText);
    }

    public static String encrypt(String plaintext, String alphabet, String key) {
        StringBuilder ciphertext = new StringBuilder();

        for (int i = 0; i < plaintext.length(); i++) {
            char ch = plaintext.charAt(i);

            if (Character.isLetter(ch)) {
                int index = alphabet.indexOf(Character.toLowerCase(ch));
                char encryptedChar = key.charAt(index);
                if (Character.isUpperCase(ch)) {
                    encryptedChar = Character.toUpperCase(encryptedChar);
                }
                ciphertext.append(encryptedChar);
            } else {
                ciphertext.append(ch);
            }
        }
        return ciphertext.toString();
    }

    public static String decrypt(String ciphertext, String alphabet, String key) {
        StringBuilder plaintext = new StringBuilder();

        for (int i = 0; i < ciphertext.length(); i++) {
            char ch = ciphertext.charAt(i);

            if (Character.isLetter(ch)) {
                int index = key.indexOf(Character.toLowerCase(ch));
                char decryptedChar = alphabet.charAt(index);
                if (Character.isUpperCase(ch)) {
                    decryptedChar = Character.toUpperCase(decryptedChar);
                }
                plaintext.append(decryptedChar);
            } else {
                plaintext.append(ch);
            }
        }
        return plaintext.toString();
    }
}
