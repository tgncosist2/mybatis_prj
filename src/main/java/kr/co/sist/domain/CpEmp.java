package kr.co.sist.domain;

import java.sql.Date;

//@Getter
//@Setter
//@NoArgsConstructor
//@ToString
public class CpEmp {

	private int empno, sal, comm, deptno;
	private String ename, job, hiredateStr;
	private Date hiredate;

	public CpEmp() {
		System.out.println("CpEmp의 기본생성자");
	}// CpEmp

	public CpEmp(int empno, int sal, int comm, String ename, String job, String hiredateStr, Date hiredate) {
		this.empno = empno;
		this.sal = sal;
		this.comm = comm;
		this.ename = ename;
		this.job = job;
		this.hiredateStr = hiredateStr;
		this.hiredate = hiredate;
		this.deptno = deptno;
		
	}// CpEmp

	public int getEmpno() {
		return empno;
	}

	public void setEmpno(int empno) {
		this.empno = empno;
	}

	public int getDeptno() {
		return deptno;
	}

	public void setDeptno(int deptno) {
		this.deptno = deptno;
	}

	public int getSal() {
		return sal;
	}

	public void setSal(int sal) {
		this.sal = sal;
	}

	public int getComm() {
		return comm;
	}

	public void setComm(int comm) {
		this.comm = comm;
	}

	public String getEname() {
		return ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public String getHiredateStr() {
		return hiredateStr;
	}

	public void setHiredateStr(String hiredateStr) {
		System.out.println("hiredateStr 불렷옹~");
		this.hiredateStr = hiredateStr;
	}

	public Date getHiredate() {
		return hiredate;
	}

	public void setHiredate(Date hiredate) {
		this.hiredate = hiredate;
	}
	
}// class
