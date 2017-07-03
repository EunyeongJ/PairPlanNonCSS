package pairplan_v1.model.member;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class MemberDAO extends SqlSessionDaoSupport{
	
	@Autowired
	@Override
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	
	//시퀀스 대신...
	public int sequence(){
		return getSqlSession().selectOne("member.sequence");
	}
	
	//아이디 중복체크
	public int confirmId(String confirmId) {
		return getSqlSession().selectOne("member.confirmId", confirmId);
	}
	
	//닉네임 중복체크
	public int confirmNick(String confirmNick) {
		return getSqlSession().selectOne("member.confirmNick", confirmNick);
	}
	
	//이메일 중복 체크
	public int confirmEmail(String confirmEmail){
		return getSqlSession().selectOne("member.confirmEmail", confirmEmail);
	}
	
	//회원 가입
	public void memberJoin(MemberDTO memberDTO){
		getSqlSession().insert("member.memberJoin", memberDTO); //회원가입
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("mem_num", memberDTO.getMem_num());
		
		//지역 뭐 뭐 찍었는지
		for(int a=0; a<memberDTO.getLoc_name().length; a++){
			System.out.println("지역 " +memberDTO.getLoc_name()[a]);
			int loc_num = memberDTO.getLoc_name()[a];
			
			map.put("loc_num", loc_num);
			
			getSqlSession().insert("preferlist.memberJoinLocation", map); //지역
		}
				
		//선호 여행 스타일 뭐 뭐 찍었는지
		for(int a=0; a<memberDTO.getStyle_name().length; a++){
			System.out.println("선호 여행 스타일 " +memberDTO.getStyle_name()[a]);
			int style_num = memberDTO.getStyle_name()[a];
			
			map.put("style_num", style_num);
			
			getSqlSession().insert("preferlist.memberJoinTravelStyle", map); //여행스타일
		}
	}
	
	//회원 로그인
	public int memberLogin(HashMap<String, Object> map){
		return getSqlSession().selectOne("member.memberLogin", map);
	}
	
	//회원 아이디로 넘버 뽑아오기
	public MemberDTO getMemberNumber(String mem_id){
		return getSqlSession().selectOne("member.getMemberNumber", mem_id);
	}

	//회원 정보빼오기
	public MemberDTO memberInfo(int mem_num){
		return getSqlSession().selectOne("member.memberInfo", mem_num);
	}	
	
	//회원 정보 수정
	public void memberInfoModify(MemberDTO memberDTO){
		getSqlSession().update("member.memberInfoModify", memberDTO);
		int mem_num = memberDTO.getMem_num();
		System.out.println(mem_num);
		getSqlSession().delete("preferlist.memberWishLocationDelete", mem_num);
		getSqlSession().delete("preferlist.memberWishTravelStyleDelete", mem_num);
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("mem_num", mem_num);
		
		//지역 찍은거 지우고 다시 insert
		for(int a=0; a<memberDTO.getLoc_name().length; a++){
			System.out.println("지역 " +memberDTO.getLoc_name()[a]);
			int loc_num = memberDTO.getLoc_name()[a];
			
			map.put("loc_num", loc_num);
			
			getSqlSession().insert("preferlist.memberJoinLocation", map); //지역
		}
				
		//선호 여행 스타일 찍은거 지우고 다시 insert
		for(int a=0; a<memberDTO.getStyle_name().length; a++){
			System.out.println("선호 여행 스타일 " +memberDTO.getStyle_name()[a]);
			int style_num = memberDTO.getStyle_name()[a];
			
			map.put("style_num", style_num);
			
			getSqlSession().insert("preferlist.memberJoinTravelStyle", map); //여행스타일
		}
	}

	//회원 탈퇴 전 비밀번호 확인
	public int memberDeleteInfoPasswordCheck(HashMap<String, Object> map){
		return getSqlSession().selectOne("member.memberDeleteInfoPasswordCheck", map);
	}
	
	//회원 탈퇴
	public int memberInfoDelete(HashMap<String, Object> map){
		getSqlSession().insert("member.memberDeleteInfoInsert", map); //일단 탈퇴 회원 테이블로 옮기고
		return getSqlSession().delete("member.memberInfoDelete", map); //회원 탈퇴
	}

	//----------------- 아이디 및 비밀번호 찾기 ----------------------
	//아이디 찾기 전 가입한 사람 있는지 확인
	public int memberIdFindCheck(HashMap<String, Object> map){
		return getSqlSession().selectOne("member.memberIdFindCheck", map);
	}
	
	//아이디 찾기
	public String memberIdFind(HashMap<String, Object> map){
		return getSqlSession().selectOne("member.memberIdFind", map);
	}
	
	//비번 찾기 전 가입자 확인
	public int memberPasswordFindCheck(HashMap<String, Object> map){
		return getSqlSession().selectOne("member.memberPasswordFindCheck", map);
	}
	
	//비밀번호 찾기
	public String memberPasswordFind(HashMap<String, Object> map){
		return getSqlSession().selectOne("member.memberPasswordFind", map);
	}
	
	//그룹에 해당하는 회원들을 조회
	public List<MemberDTO> select_groupMembers(int plan_num){
		return getSqlSession().selectList("member.groupMembers", plan_num);
	}
	
	
	//--------------------------쪽지------------------------------------
	//리스트보기
	public List<MessageDTO> msg_list(int mem_num){
		return getSqlSession().selectList("message.msg_list", mem_num);
	}
	//내용보기
	public MessageDTO msg_content(int msg_num){
		return getSqlSession().selectOne("message.msg_content", msg_num);
	}
	//답장받을사람정보줘
	public MemberDTO receiverInfo(int mem_num){
		return getSqlSession().selectOne("message.memberInfo", mem_num);
	}
	//답장보내기
	public void msg_send(MessageDTO messageDTO){
		getSqlSession().insert("message.msg_insert", messageDTO);
	}
	//삭제하기
	public void msg_delete(int msg_num){
		getSqlSession().delete("message.msg_delete", msg_num);
	}
}
