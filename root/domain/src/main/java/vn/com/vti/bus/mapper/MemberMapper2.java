package vn.com.vti.bus.mapper;

import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import vn.com.vti.bus.entity.Member;

public interface MemberMapper2 {
	
	@Select("SELECT * FROM member WHERE login_id = #{loginId};")
	@Options(useGeneratedKeys=true, keyProperty="memberId")
	
	@Results({
		@Result(property ="memberId", column ="member_id"),
		@Result(property ="loginId", column ="login_id"),
		@Result(property ="password", column ="password"),
		@Result(property ="memberName", column ="member_name"),
		@Result(property ="mailAddress", column ="mail_address"),
		@Result(property ="phoneNumber", column ="phone_number")
	})
    
	Member getMemberIdByMemberLoginId(String loginId);
}