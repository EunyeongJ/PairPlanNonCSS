package pairplan_v1.model.qna;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;

@Component
public class QnaDAO extends SqlSessionDaoSupport{
	
	@Autowired
	@Override
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}

	//인철 list
	public List<QnaDTO> list(HashMap<String, Object> map){
		return getSqlSession().selectList("qna.list", map);
	}
	
	public int countAll(){
		return getSqlSession().selectOne("qna.countall");
	}
	
	//insert
	public void insert(QnaDTO qnaDTO){
		getSqlSession().insert("qna.insert", qnaDTO);
	}
	
	//delete
	public int delete(int qna_num){
		return getSqlSession().delete("qna.delete", qna_num);
	}
	
	//질문 보기 전 비밀번호 확인
	public String getContPass(int qna_num){
		return getSqlSession().selectOne("qna.contPass", qna_num);
	}
	
	//content보기
	public QnaDTO content(int qna_num){
		return getSqlSession().selectOne("qna.content", qna_num);
	}	
	
	//태선 update
	public int update(QnaDTO qnaDTO){
		return getSqlSession().update("qna.update", qnaDTO);
	}
	
	//reply : Step 증가시키기 
	/*public void reply_update(QnaDTO qnaDTO){
		getSqlSession().update("qna.reply_update", qnaDTO);
	}*/
	
	//reply : 답변 레코드 삽입
	public void reply(QnaDTO qnaDTO){
		getSqlSession().update("qna.reply", qnaDTO);
	}
	
	//비밀번호 체크
	public String check_password(int qna_num){
		return getSqlSession().selectOne("qna.check_password", qna_num);
	}
	
}
