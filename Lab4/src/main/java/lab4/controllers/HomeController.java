package lab4.controllers;
import java.io.IOException;
import java.io.PrintWriter;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.PBEKeySpec;
import javax.crypto.spec.SecretKeySpec;
import java.security.SecureRandom;
import java.security.spec.KeySpec;
import java.util.Base64;

@Controller
public class HomeController {
    private static final int KEY_LENGTH = 256;
    private static final int ITERATION_COUNT = 65536; 
    private String secretKey = "MySecretKey";
    private String salt = "MySalt";

    @GetMapping("/")
    public String home() {
        return "WEB-INF/views/emailList.jsp";
    }

    @PostMapping("/results")
    public String getThreeParams(HttpServletRequest request) {
        String email = request.getParameter("email");
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        request.setAttribute("email", email);
        request.setAttribute("firstname", firstname);
        request.setAttribute("lastname", lastname);
        return "forward:/WEB-INF/views/emailResult.jsp";
    }

    @GetMapping("/index")
    public String gettingCookies() {
        return "WEB-INF/views/index.jsp";
    }

    @PostMapping("/cookies")
    public String doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        // print out cookies
        Cookie[] cookies = request.getCookies();
        for (int i = 0; i < cookies.length; i++) {
            Cookie c = cookies[i];
            String name = c.getName();
            String value = c.getValue();
            out.println(name + " = " + value);
        } // set a cookie
        String name = request.getParameter("name");
        if (name != null && name.length() > 0) {
            String value = request.getParameter("value");
            Cookie c = new Cookie(name, value);
            response.addCookie(c);
        }
        return "forward:/WEB-INF/views/cookieResult.jsp";
    }

    @GetMapping("/repeatedvisitor")
    public String visited() {
        return "WEB-INF/views/RepeatedVisitor.jsp";
    }

    @GetMapping("/ShowSession")
    public String showSession() {
        return "WEB-INF/views/showSession.jsp";
    }

    @GetMapping("/signin")
    public String login(HttpServletRequest request) throws Exception {
        Cookie[] cookies = request.getCookies();
        String username = "";
        String password = "";
        if (cookies != null) {
            for (Cookie c : cookies) {
                if ("username".equals(c.getName())) {
                    username = decrypt(c.getValue(), this.secretKey, this.salt);
                } else if ("password".equals(c.getName())) {
                    password = decrypt(c.getValue(), this.secretKey, this.salt);
                }
            }
        }
        request.setAttribute("username", username);
        request.setAttribute("password", password);
        return "forward:/WEB-INF/views/SignIn.jsp";
    }

    @PostMapping("/signin")
    public void login(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String remember = request.getParameter("remember");
        if (remember != null) {
            String u = encrypt(username, this.secretKey, this.salt);
            String p = encrypt(password, this.secretKey, this.salt);
            Cookie uCookie = new Cookie("username", u);
            Cookie pCookie = new Cookie("password", p);
            uCookie.setMaxAge(60 * 60 * 24 * 7);
            pCookie.setMaxAge(60 * 60 * 24 * 7);
            response.addCookie(uCookie);
            response.addCookie(pCookie);
        }

        if ("admin".equals(username) && "admin".equals(password)) {
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();

            out.println("<html>");
            out.println("<head><title>Login Successful</title></head>");
            out.println("<body>");
            out.println("<h1>Hello, " + username + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } else {
            response.sendRedirect(request.getContextPath() + "/signin");
        }
    }

    private static String encrypt(String strToEncrypt, String secretKey, String salt) {

        try {

            SecureRandom secureRandom = new SecureRandom();
            byte[] iv = new byte[16];
            secureRandom.nextBytes(iv);
            IvParameterSpec ivspec = new IvParameterSpec(iv);

            SecretKeyFactory factory = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA256");
            KeySpec spec = new PBEKeySpec(secretKey.toCharArray(), salt.getBytes(), ITERATION_COUNT, KEY_LENGTH);
            SecretKey tmp = factory.generateSecret(spec);
            SecretKeySpec secretKeySpec = new SecretKeySpec(tmp.getEncoded(), "AES");

            Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
            cipher.init(Cipher.ENCRYPT_MODE, secretKeySpec, ivspec);

            byte[] cipherText = cipher.doFinal(strToEncrypt.getBytes("UTF-8"));
            byte[] encryptedData = new byte[iv.length + cipherText.length];
            System.arraycopy(iv, 0, encryptedData, 0, iv.length);
            System.arraycopy(cipherText, 0, encryptedData, iv.length, cipherText.length);

            return Base64.getEncoder().encodeToString(encryptedData);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    private static String decrypt(String strToDecrypt, String secretKey, String salt) {
        try {
            byte[] encryptedData = Base64.getDecoder().decode(strToDecrypt);
            byte[] iv = new byte[16];
            System.arraycopy(encryptedData, 0, iv, 0, iv.length);
            IvParameterSpec ivspec = new IvParameterSpec(iv);
    
            SecretKeyFactory factory = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA256");
            KeySpec spec = new PBEKeySpec(secretKey.toCharArray(), salt.getBytes(), ITERATION_COUNT, KEY_LENGTH);
            SecretKey tmp = factory.generateSecret(spec);
            SecretKeySpec secretKeySpec = new SecretKeySpec(tmp.getEncoded(), "AES");
    
            Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
            cipher.init(Cipher.DECRYPT_MODE, secretKeySpec, ivspec);
    
            byte[] cipherText = new byte[encryptedData.length - 16];
            System.arraycopy(encryptedData, 16, cipherText, 0, cipherText.length);
    
            byte[] decryptedText = cipher.doFinal(cipherText);
            return new String(decryptedText, "UTF-8");
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
      }

}
