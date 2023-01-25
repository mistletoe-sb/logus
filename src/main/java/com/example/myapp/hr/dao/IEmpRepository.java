package com.example.myapp.hr.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.example.myapp.hr.model.EmpVO;

public interface IEmpRepository {
	public abstract int getEmpCount();				// 전체 사원 수 반환 메서드
	public abstract int getEmpCount(int deptid);	// 해당 부서 사원 수 반환 메서드
	public abstract List<EmpVO> getEmpInfo();		// 전체 사원 정보 목록 반환 메서드
	public abstract EmpVO getEmpInfo(int empid);	// 해당 사원 정보 반환 메서드
	public abstract void updateEmp(EmpVO emp);				// 사원 정보 update 메서드
	public abstract void insertEmp(EmpVO emp);				// 사원 정보 insert 메서드
	public abstract void deleteJobHistory(int empid);		// 사원 직무 기록 delete 메서드
	public abstract int deleteEmp(@Param("empid") int empid, @Param("email") String email);	// 사원 정보 delete 메서드
	public abstract List<Map<String, Object>> getAllDeptId();				// 모든 부서ID 반환 메서드
	public abstract List<Map<String, Object>> getAllJobId();				// 모든 직무ID 반환 메서드
	public abstract List<Map<String, Object>> getAllManagerId();			// 모든 관리자ID 반환 메서드
}
