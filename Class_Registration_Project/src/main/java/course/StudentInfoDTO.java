package course;

public class StudentInfoDTO {
    private String studentId; //학생 Id
    private String studentName; //학생 이름
    private String grade; //학생 성적
    private String lecturerName; //지도교수 이름
    private String status; //학생 상태(재학/휴학/자퇴)

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }
    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public String getLecturerName() {
        return lecturerName;
    }

    public void setLecturerName(String lecturerName) {
        this.lecturerName = lecturerName;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
