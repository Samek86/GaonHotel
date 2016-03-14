package mail.common;

import java.util.Date;
import java.util.Properties;
 
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import mail.common.MailBean;
 
public class SMTP {
 
    public void send(MailBean bean) {
    	 Properties p = System.getProperties();
       p.put("mail.smtp.starttls.enable", "true");     // gmail은 무조건 true 고정
       p.put("mail.smtp.host", "smtp.gmail.com");      // smtp 서버 주소
       p.put("mail.smtp.auth","true");                 // gmail은 무조건 true 고정
       p.put("mail.smtp.port", "587");                 // gmail 포트
       Authenticator auth = new MyAuthentication();
       //session 생성 및  MimeMessage생성
       Session session = Session.getDefaultInstance(p, auth);
       MimeMessage msg = new MimeMessage(session);
       try{
           //편지보낸시간
           msg.setSentDate(new Date());
           InternetAddress from = new InternetAddress() ;
           from = new InternetAddress("GAON<"+bean.getEmail()+">");
           // 이메일 발신자
           msg.setFrom(from);
           
           // 이메일 수신자 받을사람
           InternetAddress to = new InternetAddress(bean.getEmail()); 

           msg.setRecipient(Message.RecipientType.TO, to);
           // 이메일 제목
           msg.setSubject(bean.getTitle(), "UTF-8");
           // 이메일 내용 
           msg.setText(bean.getText(), "UTF-8");
           // 이메일 헤더 
           msg.setHeader("content-Type", "text/html");
           //메일보내기
           javax.mail.Transport.send(msg);
       }catch (AddressException addr_e) {
           addr_e.printStackTrace();
       }catch (MessagingException msg_e) {
           msg_e.printStackTrace();
       }
   }
}
class MyAuthentication extends Authenticator {
    PasswordAuthentication pa;
    public MyAuthentication(){
        String id = "gaonhotel16";       // 구글 ID
        String pw = "rkdhsghxpf";          // 구글 비밀번호 가온호텔
        // ID와 비밀번호를 입력한다.
        pa = new PasswordAuthentication(id, pw);
    }
    public PasswordAuthentication getPasswordAuthentication() {
        return pa;
    }
}