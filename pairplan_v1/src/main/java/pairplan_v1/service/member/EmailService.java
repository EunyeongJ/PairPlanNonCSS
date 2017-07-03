package pairplan_v1.service.member;

import java.util.HashMap;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import pairplan_v1.model.member.MemberDAO;

//메일 인증 구현
@Component
public class EmailService{

//	//javaframework에 있음
//	@Autowired
//	private JavaMailSender javaMailSender;
//		
//	public void setJavaMailSender(JavaMailSender javaMailSender) {
//		this.javaMailSender = javaMailSender;
//	}

	@Autowired
	MemberDAO memberDAO;

	//이메일 중복검사
	//@Override
	public int confirmEmail(String email) {
		return memberDAO.confirmEmail(email);
	}	
	
	//이메일 보내기
	//@Override
	public boolean send(String subject, String text, String to) {
		
		final String username = "homee5200@naver.com"; //아이디
		final String password = "SEFTHUxdvgnj79"; //비밀번호
		
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.naver.com");
		props.put("mail.smtp.auth", "true");
		
		Session session = Session.getInstance(props, new javax.mail.Authenticator(){
			protected PasswordAuthentication getPasswordAuthentication(){
				return new PasswordAuthentication(username, password);
			}
		});
		
		try {			
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(username));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
			message.setSubject(subject);
			message.setText(text);
			System.out.println(message.toString());
			
			Transport.send(message);
			System.out.println("이메일 인증 전송!");
			return true;
			
		} catch (Exception e) {
			e.getMessage();
		}			
		return false;
	}

	//아이디 찾기 전 가입자 찾기
	//@Override
	public int memberIdFindCheck(HashMap<String, Object> map) {		
		return memberDAO.memberIdFindCheck(map);
	}

	//아이디 찾기
	//@Override
	public String memberIdFind(HashMap<String, Object> map) {
		return memberDAO.memberIdFind(map);
	}

	//비밀번호 찾기 전 가입자 찾기
	//@Override
	public int memberPasswordFindCheck(HashMap<String, Object> map) {
		return memberDAO.memberPasswordFindCheck(map);
	}

	//비밀번호 찾기
	//@Override
	public String memberPasswordFind(HashMap<String, Object> map) {
		return memberDAO.memberPasswordFind(map);
	}
	
	
}
