package HomeHeaven.util;

import java.util.regex.*;

public class Validator {

    private static final String PASSWORD_REGEX =
            "^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[@$!%*?&]).{6,}$";

    public static boolean validatePassword(String password) {
        return Pattern.matches(PASSWORD_REGEX, password);
    }

    public static boolean validateEmail(String email) {
        return email != null && email.contains("@");
    }

    public static boolean validatePhone(String phone) {
        return phone != null && phone.matches("\\d{10}");
    }
}
