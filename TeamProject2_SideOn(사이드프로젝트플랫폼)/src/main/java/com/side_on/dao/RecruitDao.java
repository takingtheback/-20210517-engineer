package com.side_on.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.side_on.dto.Apply;
import com.side_on.dto.Criteria;
import com.side_on.dto.CriteriaRc;
import com.side_on.dto.Member;
import com.side_on.dto.RecruitBoard;
import com.side_on.dto.RecruitCriteria;
import com.side_on.dto.RecruitMyPage;
import com.side_on.dto.Reward;

@Mapper
public interface RecruitDao {


	//게시글 등록
	public int insertRecruitBoard(RecruitBoard recruitBoard);

	//게시글 총 갯수
	public int allCount(Criteria cri);
	
	//게시글 전체 리스트
	public List<RecruitBoard> getListPaging(Criteria cri);
	public ArrayList<RecruitBoard> memberAll();

	public RecruitBoard memberDetail(int recruit_num);

	public int recruitApply(Apply apply);

	public int getApply_Num(int recruit_num, String memberId);

	public void plusCount(int recruit_num, int apply_num, int count, String part);

	public int selectFront(int recruit_num, String front);
	public int selectBack(int recruit_num, String back);
	public int selectAos(int recruit_num, String aos);
	public int selectIos(int recruit_num, String ios);
	public int selectServer(int recruit_num, String server);
	public int selectUxui(int recruit_num, String uxui);
	public int selectPlan(int recruit_num, String plan);
	public int selectPm(int recruit_num, String pm);

	public List<HashMap<String,String>> mypageApply(String memberId);

	public ArrayList<RecruitMyPage> myApplyAll(String memberId);

	public ArrayList<RecruitBoard> myRecruit(String memberId);

	public ArrayList<Apply> myApply(String memberId);


	public int recruitCancel(int recruit_num, String memberId, String join_yn);

	public ArrayList<RecruitBoard> recruitMyRecruit(String memberId);

	public ArrayList<Apply> getApplyList(int recruit_num);

	public String getMemberInfo(String memberId);

	public int recruitDelete(int recruit_num, String n);

	public int updateRecruitBoard(RecruitBoard recruitBoard);

	public int updateRecruitBoard(Reward reward);

	public String getWriterMemberId(int recruit_num);

	public int setReward(Reward reward);

	public String getPayAmount(int recruit_num, String writer_memberId);

	public ArrayList<Reward> getRewardList();

	public int getReward(int payment_id, int recruit_num, String pay_amount);

	public String getMemberId(String name, String mobile);

	public String getPwMemberId(String memberId, String mobile);

	public int resetPw(String memberId, String resetPw);

	public ArrayList<RecruitBoard> listSearch(String search);






	

}
