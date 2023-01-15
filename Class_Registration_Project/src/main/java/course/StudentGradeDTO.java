package course;

public class StudentGradeDTO {
    String className; //수업이름
    String courseId; //학수번호
    String opened; //년도
    int credit; //학점수
    String grade; //성적


    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public String getCourseId() {
        return courseId;
    }

    public void setCourseId(String courseId) {
        this.courseId = courseId;
    }

    public String getOpened() {
        return opened;
    }

    public void setOpened(String opened) {
        this.opened = opened;
    }

    public int getCredit() {
        return credit;
    }

    public void setCredit(int credit) {
        this.credit = credit;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }
}
