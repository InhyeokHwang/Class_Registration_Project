package course;

public class SearchDTO {
    private String classId; //수업Id
    private String classNo; //수업번호
    private String courseId; //학수번호
    private String courseName; //교과목명
    private String lecturerName; //교강사 이름

    private String majorId; //전공 아이디

    private String year; //수업의 권장 학년

    private int credit; //수업의 학점수

    private String lecturerId; //교수 ID

    private String period1; //period1
    private String beginTime1; //수업 시작시간
    private String endTime1; //수업 종료시간
    private String period2; //period2
    private String beginTime2; //수업 시작시간
    private String endTime2; //수업 종료시간

    private String registeredStudents; //신청인원
    private String personMax; //수강 정원
    private String buildingName; //빌딩 이름
    private String roomId; //강의실 호수

    private String opened; //열린 해

    private String repitition; // 재수강 여부

    public String getRepitition() {
        return repitition;
    }

    public void setRepitition(String repitition) {
        this.repitition = repitition;
    }

    public String getClassId() {
        return classId;
    }

    public void setClassId(String classId) {
        this.classId = classId;
    }

    public String getClassNo() {
        return classNo;
    }

    public void setClassNo(String classNo) {
        this.classNo = classNo;
    }

    public String getLecturerId() {
        return lecturerId;
    }

    public void setLecturerId(String lecturerId) {
        this.lecturerId = lecturerId;
    }

    public String getCourseId() {
        return courseId;
    }

    public void setCourseId(String courseId) {
        this.courseId = courseId;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getLecturerName() {
        return lecturerName;
    }

    public void setLecturerName(String lecturerName) {
        this.lecturerName = lecturerName;
    }

    public String getMajorId() {
        return majorId;
    }

    public void setMajorId(String majorId) {
        this.majorId = majorId;
    }

    public int getCredit() {
        return credit;
    }

    public void setCredit(int credit) {
        this.credit = credit;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public String getPeriod1() {
        return period1;
    }

    public void setPeriod1(String period1) {
        this.period1 = period1;
    }

    public String getBeginTime1() {
        return beginTime1;
    }

    public void setBeginTime1(String beginTime1) {
        this.beginTime1 = beginTime1;
    }

    public String getEndTime1() {
        return endTime1;
    }

    public void setEndTime1(String endTime1) {
        this.endTime1 = endTime1;
    }

    public String getPeriod2() {
        return period2;
    }

    public void setPeriod2(String period2) {
        this.period2 = period2;
    }

    public String getBeginTime2() {
        return beginTime2;
    }

    public void setBeginTime2(String beginTime2) {
        this.beginTime2 = beginTime2;
    }

    public String getEndTime2() {
        return endTime2;
    }

    public void setEndTime2(String endTime2) {
        this.endTime2 = endTime2;
    }

    public String getRegisteredStudents() {
        return registeredStudents;
    }

    public void setRegisteredStudents(String registeredStudents) {
        this.registeredStudents = registeredStudents;
    }

    public String getPersonMax() {
        return personMax;
    }

    public void setPersonMax(String personMax) {
        this.personMax = personMax;
    }

    public String getBuildingName() {
        return buildingName;
    }

    public void setBuildingName(String buildingName) {
        this.buildingName = buildingName;
    }

    public String getRoomId() {
        return roomId;
    }

    public void setRoomId(String roomId) {
        this.roomId = roomId;
    }

    public String getOpened() {
        return opened;
    }

    public void setOpened(String opened) {
        this.opened = opened;
    }
}
