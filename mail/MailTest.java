package test;

public class MailTest {
	SendEmail mail= new SendEmail();
	public static void main(String[] args) {
		String firstname="Shubham sharma";
		String test="Hello "+firstname +"Click here for varification Trabaajo";
		
		
		String email="supriyagoswami17@gmail.com";
		String Subject="Mail varification";
		String trabaajo_id="jobsforshubham1@gmail.com";
		String trabaajo_password="Shubham@123";
		boolean mailsuccess = false ;
		try{
			mailsuccess=SendEmail.send(trabaajo_id, trabaajo_password, email, Subject, test);
			if(!mailsuccess){
				System.out.println("Not sent");
			}
			else{
				System.out.println("Send");
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

}
