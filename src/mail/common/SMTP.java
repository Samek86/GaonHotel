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
       p.put("mail.smtp.starttls.enable", "true");     // gmail�� ������ true ����
       p.put("mail.smtp.host", "smtp.gmail.com");      // smtp ���� �ּ�
       p.put("mail.smtp.auth","true");                 // gmail�� ������ true ����
       p.put("mail.smtp.port", "587");                 // gmail ��Ʈ
       Authenticator auth = new MyAuthentication();
       //session ���� ��  MimeMessage����
       Session session = Session.getDefaultInstance(p, auth);
       MimeMessage msg = new MimeMessage(session);
       try{
           //���������ð�
           msg.setSentDate(new Date());
           InternetAddress from = new InternetAddress() ;
           from = new InternetAddress("GAON<"+bean.getEmail()+">");
           // �̸��� �߽���
           msg.setFrom(from);
           
           // �̸��� ������ �������
           InternetAddress to = new InternetAddress(bean.getEmail()); 

           msg.setRecipient(Message.RecipientType.TO, to);
           // �̸��� ����
           msg.setSubject(bean.getTitle(), "UTF-8");
           // �̸��� ���� 
           msg.setText(bean.getText(), "UTF-8");
           // �̸��� ��� 
           msg.setHeader("content-Type", "text/html");
           //���Ϻ�����
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
        String id = "gaonhotel16";       // ���� ID
        String pw = "rkdhsghxpf";          // ���� ��й�ȣ ����ȣ��
        // ID�� ��й�ȣ�� �Է��Ѵ�.
        pa = new PasswordAuthentication(id, pw);
    }
    public PasswordAuthentication getPasswordAuthentication() {
        return pa;
    }
}