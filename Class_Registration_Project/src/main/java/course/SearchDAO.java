package course;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class SearchDAO {

    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    public SearchDAO()
    {
        try{
            String dbURL = "jdbc:mysql://localhost:3307/DB2021058995?serverTimezone=Asia/Seoul";
            String dbID = "root";
            String dbPassword = "qhdls1626!";
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
        } catch (Exception e){
            e.printStackTrace();
        }
    }


    public List<SearchDTO> selectList(Map<String, Object> map){ //수강편람 기능, 만족하는 칼럼에 해당하는 튜플을 한번에 출력하기 위해 조인을 많이 사용하였음.
        List<SearchDTO> list = new ArrayList<>();

        String SQL = "select c.class_id, c.class_no, c.course_id, ti1.period as period1, ti1.begin as begin1, ti1.end as end1, ti2.period as period2, ti2.begin as begin2, ti2.end as end2, c.name as cname, count(distinct ta.student_id) as registered_students, l.name as lname, c.person_max, b.name as bname, r.room_id, st.student_id as repitition \n" +
                "from class as c\n" +
                "inner join time as ti1\n" +
                "on c.class_id = ti1.class_id and ti1.period= \"1\"\n" + //1period과 2period가 별도의 튜플로 존재하기 때문에 self join을 통해 같은 튜플 상에 위치하도록 한다.
                "left outer join time as ti2\n" +
                "on c.class_id = ti2.class_id and ti2.period = \"2\"\n" +
                "inner join room as r\n" +
                "on c.room_id = r.room_id\n" +
                "inner join building as b\n" +
                "on r.building_id = b.building_id\n" +
                "inner join lecturer as l\n" +
                "on l.lecturer_id = c.lecturer_id\n" +
                "left outer join takes as ta\n" +
                "on ta.class_id = c.class_id\n" +
                "left outer join (\n" + //student_id 값은 repitition에 들어가며 null이 아닐 경우에 재수강 대상 과목에 해당된다, 해당 학생에 대한 student_id 값은 넣어주면 된다.
                "\tselect student_id, course_id \n" +
                "    from credits \n" +
                "    where student_id = ? and (grade = \"C+\" or grade = \"C0\" or grade = \"D+\" or grade = \"D0\" or grade = \"F\")) as st\n" +
                "on c.course_id = st.course_id \n" +
                "group by c.class_id\n"; //수강신청한 학생수를 구하기 위해 group by를 사용


        String searchField = (String)map.get("searchField");

        if(searchField != null){ //서치 필드에 따라 having 조건문을 추가함
            if(searchField.equals("cname")){
                SQL += " HAVING " + searchField + " Like '%" + map.get("searchWord") + "%'\n"; //키워드 포함 검색
            }else if(searchField.equals("course_id")){
                SQL += " HAVING " + searchField + " = '" + map.get("searchWord") + "'\n"; //완전 일치 검색
            }else if(searchField.equals("class_no")){
                SQL += " HAVING " + searchField + " = '" + map.get("searchWord") + "'\n"; //완전 일치 검색
            }
            SQL += " ORDER BY class_no ASC";
        }

        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, (String)map.get("student_id"));

            rs = pstmt.executeQuery();

            while(rs.next()){
                SearchDTO dto = new SearchDTO();

                dto.setClassId(rs.getString("class_id"));
                dto.setClassNo(rs.getString("class_no"));
                dto.setCourseId(rs.getString("course_id"));
                dto.setCourseName(rs.getString("cname"));
                dto.setLecturerName(rs.getString("lname"));
                dto.setPeriod1(rs.getString("period1"));
                dto.setBeginTime1(rs.getString("begin1"));
                dto.setEndTime1(rs.getString("end1"));
                dto.setPeriod2(rs.getString("period2"));
                dto.setBeginTime2(rs.getString("begin2"));
                dto.setEndTime2(rs.getString("end2"));
                dto.setRegisteredStudents(rs.getString("registered_students"));
                dto.setPersonMax(rs.getString("person_max"));
                dto.setBuildingName(rs.getString("bname"));
                dto.setRoomId(rs.getString("room_id"));
                dto.setRepitition(rs.getString("repitition")); //재수강 대상 과목인지 표시

                list.add(dto);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return list;
    }

    public StudentInfoDTO searchStudentInfo(Map<String, Object> map){ //어드민에서 학생 정보 조회
        StudentInfoDTO dto = new StudentInfoDTO();
        String SQL = "select " +
                " co.credit, " +
                " s.student_id, " +
                " s.name as student_name, " +
                "    round(sum(co.credit*(case grade " + //성적을 숫자로 parsing해줘야함, 나눗셈이 있으므로 반올림까지 함
                "  when 'A+' then 4.5 " +
                "        when 'A0' then 4.0 " +
                "  when 'B+' then 3.5 " +
                "        when 'B0' then 3.0 " +
                "        when 'C+' then 2.5 " +
                "        when 'C0' then 2.0 " +
                "        when 'D+' then 1.5 " +
                "        when 'D0' then 1.0 " +
                "        when 'F' then 0 " +
                " End))/sum(co.credit),2) as grade, " +
                "    l.name as lecturer_name, " +
                "    s.status " +
                "from student as s " +
                "inner join credits as cr " +
                "on s.student_id = cr.student_id " +
                "inner join lecturer as l " +
                "on s.lecturer_id = l.lecturer_id " +
                "inner join course as co " +
                "on co.course_id = cr.course_id " +
                "group by s.student_id "; //각 학생들의 평균 평점이므로 학생의 id를 기준으로 생각해야됨

            String searchField = (String)map.get("searchField");

            if(searchField != null){
                if(searchField.equals("student_id")){
                    SQL += " HAVING " + searchField + " = '" + map.get("searchWord") + "'\n";
                }else if(searchField.equals("student_name")) {
                    SQL += " HAVING " + searchField + " = '" + map.get("searchWord") + "'\n";
                }
            }

        try{
            pstmt = conn.prepareStatement(SQL);
            rs = pstmt.executeQuery();

            if(rs.next()){
                dto.setStudentId(rs.getString("student_id"));
                dto.setStudentName(rs.getString("student_name"));
                dto.setGrade(rs.getString("grade"));
                dto.setLecturerName(rs.getString("lecturer_name"));
                dto.setStatus(rs.getString("status"));
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return dto;
    }


    public List<StudentGradeDTO> studentGrade(String student_id){ //학생 성적
        List<StudentGradeDTO> list = new ArrayList<>();
        String SQL = "select co.name, co.course_id, cr.year, co.credit, cr.grade\n" +
                "from credits as cr\n" +
                "inner join course as co\n" +
                "on cr.course_id = co.course_id\n" +
                "where student_id = ?";

        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, student_id);

            rs = pstmt.executeQuery();

            while(rs.next()){
                StudentGradeDTO dto = new StudentGradeDTO();

                dto.setClassName(rs.getString("name"));
                dto.setCourseId(rs.getString("course_id"));
                dto.setOpened(rs.getString("year"));
                dto.setCredit(rs.getInt("credit"));
                dto.setGrade(rs.getString("grade"));
                list.add(dto);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return list;
    }

    public void changeStatus(StudentInfoDTO dto){ //학생 상태 변경 재학, 휴학, 자퇴

        String SQL = " UPDATE student " +
                " SET status = ? " +
                " WHERE student_id = ? ";
        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, dto.getStatus());
            pstmt.setString(2, dto.getStudentId());

            pstmt.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    public void deleteClass(String class_id){ //어드민이 수업 삭제
        String SQL = " DELETE FROM class " +
                     " WHERE class_id = ? ";
        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, class_id);

            pstmt.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    public CRCLASSDTO createClassCondition(String room_id){ //수강 정원이 강의실 수용 인원보다 초과할 경우 과목 개설 불가능
        CRCLASSDTO dto = new CRCLASSDTO();
        String SQL = "select occupancy from room\n" +
                "where room_id = ?";
        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, room_id);

            rs = pstmt.executeQuery();
            while(rs.next()){
                dto.setOccupancy(rs.getString("occupancy"));
            }

        }catch(Exception e){
            e.printStackTrace();
        }
        return dto;
    }
    public void createClassClass(SearchDTO dto){ // 어드민이 수업 개설하는 과정에서 class 테이블에 값 추가
        String SQL = "insert into class values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, dto.getClassId());
            pstmt.setString(2, dto.getClassNo());
            pstmt.setString(3, dto.getCourseId());
            pstmt.setString(4, dto.getCourseName());
            pstmt.setString(5, dto.getMajorId());
            pstmt.setString(6, dto.getYear());
            pstmt.setInt(7, dto.getCredit());
            pstmt.setString(8, dto.getLecturerId());
            pstmt.setString(9, dto.getPersonMax());
            pstmt.setString(10, dto.getOpened());
            pstmt.setString(11, dto.getRoomId());

            pstmt.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    public void createClassTimeE(SearchDTO dto){ // 어드민이 수업 개설하는 과정에서 time 테이블에 값 추가 (E learning인 경우)
        String SQL = "insert into time(class_id, period, begin, end) values (?, ?, ?, ?)";

        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, dto.getClassId());
            pstmt.setString(2, "1");
            pstmt.setString(3, "NO");
            pstmt.setString(4, "NO");

            pstmt.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    public void createClassTime1(SearchDTO dto){ // 어드민이 수업 개설하는 과정에서 time 테이블에 값 추가 (period가 1인 경우)
        String SQL = "insert into time(class_id, period, begin, end) values (?, ?, ?, ?)";

        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, dto.getClassId());
            pstmt.setString(2, "1");
            pstmt.setString(3, dto.getBeginTime1());
            pstmt.setString(4, dto.getEndTime1());

            pstmt.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    public void createClassTime2(SearchDTO dto){ // 어드민이 수업 개설하는 과정에서 time 테이블에 값 추가 (period가 2인 경우)
        String SQL = "insert into time(class_id, period, begin, end) values (?, ?, ?, ?)";

        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, dto.getClassId());
            pstmt.setString(2, "2");
            pstmt.setString(3, dto.getBeginTime2());
            pstmt.setString(4, dto.getEndTime2());

            pstmt.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
    }


    public List<OLAPDTO> studentStatistic(){ //학생 통계
        List<OLAPDTO> list = new ArrayList<>();
        String SQL = "select avg(gradeavg.grade - eachgrade.grade) as diff, co.name, eachgrade.course_id\n" +
                "from\n" +
                "(select \n" + //학생들의 점수 평균을 구하는 과정이다. 성적을 parsing 하는 과정은 잘 알려진 case when then으로 하였다.
                "\tco.course_id,\n" +
                "\tco.credit,\n" +
                "\ts.student_id, \n" +
                "\ts.name as student_name, \n" +
                "    sum(co.credit*(case grade \n" + //성적을 학점수와 곱한 다음 총 학점으로 나누기
                "\t\twhen 'A+' then 4.5\n" +
                "        when 'A0' then 4.0\n" +
                "\t\twhen 'B+' then 3.5\n" +
                "        when 'B0' then 3.0\n" +
                "        when 'C+' then 2.5\n" +
                "        when 'C0' then 2.0\n" +
                "        when 'D+' then 1.5\n" +
                "        when 'D0' then 1.0\n" +
                "        when 'F' then 0\n" +
                "\tEnd))/sum(co.credit) as grade,\n" +
                "    l.name as lecturer_name,\n" +
                "    s.status\n" +
                "from student as s\n" +
                "inner join credits as cr\n" +
                "on s.student_id = cr.student_id\n" +
                "inner join lecturer as l\n" +
                "on s.lecturer_id = l.lecturer_id\n" +
                "inner join course as co\n" +
                "on co.course_id = cr.course_id\n" +
                "group by s.student_id\n" + //학생들의 점수 평균이므로 학생ID로 group 하였다
                "order by s.student_id) as gradeavg\n" +
                "inner join (select student_id, course_id, case grade \n" + //credit을 학생 평균 점수에 inner join 한다. --> 학생들이 들었던 과목별로 group by가 가능해짐
                "\twhen 'A+' then 4.5\n" +
                "\twhen 'A0' then 4.0\n" +
                "\twhen 'B+' then 3.5\n" +
                "\twhen 'B0' then 3.0\n" +
                "\twhen 'C+' then 2.5\n" +
                "\twhen 'C0' then 2.0\n" +
                "\twhen 'D+' then 1.5\n" +
                "\twhen 'D0' then 1.0\n" +
                "\twhen 'F' then 0\n" +
                "    End as grade\n" +
                "from credits) as eachgrade\n" +
                "on eachgrade.student_id = gradeavg.student_id\n" +
                "inner join course as co\n" + //course의 이름을 알아야 하기 때문에 course를 조인하였다.
                "on co.course_id = eachgrade.course_id\n" +
                "group by eachgrade.course_id\n" +
                "order by diff desc\n" +
                "limit 10";

        try{
            pstmt = conn.prepareStatement(SQL);
            rs = pstmt.executeQuery();

            while(rs.next()){
                OLAPDTO dto = new OLAPDTO();

                dto.setName(rs.getString("name"));
                dto.setCourse_id(rs.getString("course_id"));

                list.add(dto);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return list;
    }






    public void registerClass(TakesDTO dto){ //수강신청
        String SQL = " INSERT into takes(student_id, class_id) values (?, ?)";

        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, dto.getStudentId());
            pstmt.setString(2, dto.getClassId());

            pstmt.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    public int registrationCheck1(String course_id, String student_id){ //수강신청 조건1 - 이전 성적이 B0이상일 경우 수강 신청 불가능
        String SQL = "select * " +
                " FROM credits " +
                " WHERE student_id = ? and course_id = ? and (grade = \"B0\" or grade = \"B+\" or grade = \"A0\" or grade = \"A+\")";

        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, student_id);
            pstmt.setString(2, course_id);

            rs = pstmt.executeQuery();

            if(rs.next()){
                return 0; //재수강이 불가능
            }else{
                return 1; //재수강 가능
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return -1; //데이터베이스 오류
    }

    public int registrationCheck2(String class_id, String registered_students){ //수강신청 조건2 - 정원이 다 찼을 경우 해당 과목 수강 신청 불가능
        String SQL = "SELECT * FROM class WHERE class_id = ? and person_max > ?";

        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, class_id);
            pstmt.setInt(2, Integer.parseInt(registered_students));


            rs = pstmt.executeQuery();
            if(rs.next()){ //존재하면 조건 2 통과
                return 1;
            }else{
                return 0;
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return -1; //데이터베이스 오류
    }

    public int registrationCheck3(String student_id, String class_id, String beginTime1, String endTime1, String beginTime2, String endTime2){ //수강신청 조건3 - 동일 시간대에 2개 이상의 과목 수강 신청은 불가능
        String SQL = "SELECT ti1.begin as begin1, ti1.end as end1, ti2.begin as begin2, ti2.end as end2 " +
                " FROM takes as ta " +
                " inner join time as ti1 " +
                " on ta.class_id = ti1.class_id and ti1.period = \"1\" " +
                " left outer join time as ti2 " +
                " on ta.class_id = ti2.class_id and ti2.period = \"2\" " +
                " WHERE ta.student_id = ?";

        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, student_id);

            rs = pstmt.executeQuery();

            while(rs.next()){

            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return -1; //데이터베이스 오류
    }

    public int registrationCheck4(String class_id, String student_id){ //수강신청 조건4 - 최대 학점은 18학점으로 제한하여 초과 신청은 불가능
        String SQL = "SELECT sum(credit) + (SELECT credit FROM class WHERE class_id = ?) as total_credit " +
                " FROM takes as ta " +
                " inner join class as cl " +
                " on ta.class_id = cl.class_id " +
                " WHERE ta.student_id = ?";

        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, class_id);
            pstmt.setString(2, student_id);

            rs = pstmt.executeQuery();

            if(rs.next()){
                if(rs.getInt("total_credit") <= 18){ //신청하는 과목의 학점수와 기존 takes에 담겨있던 학점수들의 합이 18보다 작거나 같음
                    return 1;
                }else{
                    return 0;
                }
            }

        }catch(Exception e){
            e.printStackTrace();
        }
        return -1; //데이터베이스 오류
    }

    public List<SearchDTO> registeredList(String student_id){ //희망 신청 내역
        // 수정해야됨
        List<SearchDTO> list = new ArrayList<>();

        String SQL = " select t.student_id, c.class_id, c.class_no, c.course_id, ti1.period as period1, ti1.begin as begin1, ti1.end as end1, ti2.period as period2, ti2.begin as begin2, ti2.end as end2, c.name as cname, l.name as lname, c.person_max, b.name as bname, r.room_id\n" +
                "from takes as t\n" +
                "inner join class as c\n" +
                "on c.class_id = t.class_id\n" +
                "inner join time as ti1\n" +
                "on c.class_id = ti1.class_id and ti1.period= \"1\"\n" +
                "left outer join time as ti2\n" +
                "on c.class_id = ti2.class_id and ti2.period = \"2\"\n" +
                "inner join room as r\n" +
                "on c.room_id = r.room_id\n" +
                "inner join building as b\n" +
                "on r.building_id = b.building_id\n" +
                "inner join lecturer as l\n" +
                "on l.lecturer_id = c.lecturer_id\n" +
                "where student_id = ?"; //searchlist에서 했던 쿼리와 매우 비슷하다

        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, student_id);

            rs = pstmt.executeQuery();

            while(rs.next()){
                SearchDTO dto = new SearchDTO();

                dto.setClassId(rs.getString("class_id"));
                dto.setClassNo(rs.getString("class_no"));
                dto.setCourseId(rs.getString("course_id"));
                dto.setCourseName(rs.getString("cname"));
                dto.setLecturerName(rs.getString("lname"));
                dto.setPeriod1(rs.getString("period1"));
                dto.setBeginTime1(rs.getString("begin1"));
                dto.setEndTime1(rs.getString("end1"));
                dto.setPeriod2(rs.getString("period2"));
                dto.setBeginTime2(rs.getString("begin2"));
                dto.setEndTime2(rs.getString("end2"));
                dto.setBuildingName(rs.getString("bname"));
                dto.setRoomId(rs.getString("room_id"));

                list.add(dto);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return list;
    }

    public void registeredDelete(String class_id, String student_id){ //수강신청 삭제
        String SQL = " DELETE FROM takes WHERE class_id = ? and student_id = ? ";

        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, class_id);
            pstmt.setString(2, student_id);
            pstmt.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }

    }



    public void wishAdd(String class_id, String student_id){ //희망 목록에 추가
        String SQL = " INSERT into wish(student_id, class_id) values (?, ?)";

        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, student_id);
            pstmt.setString(2, class_id);

            pstmt.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    public void wishDelete(String class_id, String student_id){ //희망 삭제
        String SQL = " DELETE FROM wish WHERE class_id = ? and student_id = ? ";

        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, class_id);
            pstmt.setString(2, student_id);
            pstmt.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    public List<SearchDTO> wishList(String student_id){ //희망 신청 내역
        //수정 필요
        List<SearchDTO> list = new ArrayList<>();

        String SQL = "select w.student_id, c.class_id, c.class_no, c.course_id, ti1.period as period1, ti1.begin as begin1, ti1.end as end1, ti2.period as period2, ti2.begin as begin2, ti2.end as end2, c.name as cname, count(distinct ta.student_id) as registered_students, l.name as lname, c.person_max, b.name as bname, r.room_id\n" +
                "from class as c\n" +
                "inner join time as ti1\n" +
                "on c.class_id = ti1.class_id and ti1.period= \"1\"\n" +
                "left outer join time as ti2\n" +
                "on c.class_id = ti2.class_id and ti2.period = \"2\"\n" +
                "inner join room as r\n" +
                "on c.room_id = r.room_id\n" +
                "inner join building as b\n" +
                "on r.building_id = b.building_id\n" +
                "inner join lecturer as l\n" +
                "on l.lecturer_id = c.lecturer_id\n" +
                "left outer join takes as ta\n" +
                "on ta.class_id = c.class_id\n" +
                "left outer join wish as w\n" +
                "on w.class_id = c.class_id\n" +
                "group by c.class_id\n" +
                "having w.student_id = ?\n" +
                "order by c.class_no"; //searchlist에서 했던 쿼리와 매우 유사하다, wish만 outer조인 해주었다.

        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, student_id);

            rs = pstmt.executeQuery();

            while(rs.next()){
                SearchDTO dto = new SearchDTO();

                dto.setClassId(rs.getString("class_id"));
                dto.setClassNo(rs.getString("class_no"));
                dto.setCourseId(rs.getString("course_id"));
                dto.setCourseName(rs.getString("cname"));
                dto.setLecturerName(rs.getString("lname"));
                dto.setPeriod1(rs.getString("period1"));
                dto.setBeginTime1(rs.getString("begin1"));
                dto.setEndTime1(rs.getString("end1"));
                dto.setPeriod2(rs.getString("period2"));
                dto.setBeginTime2(rs.getString("begin2"));
                dto.setEndTime2(rs.getString("end2"));
                dto.setRegisteredStudents(rs.getString("registered_students"));
                dto.setPersonMax(rs.getString("person_max"));
                dto.setBuildingName(rs.getString("bname"));
                dto.setRoomId(rs.getString("room_id"));

                list.add(dto);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return list;
    }
    public TimeTableDTO timeTable(String student_id){
        String SQL = "select t1.begin as period1begin, t1.end as period1end, t2.begin as period2begin, t2.end as period2end\n" +
                "from takes as t\n" +
                "inner join time as t1\n" +
                "on t1.class_id = t.class_id and t1.period = \"1\"\n" +
                "left outer join time as t2\n" +
                "on t2.class_id = t.class_id and t2.period = \"2\"\n" +
                "where student_id = ?";

        TimeTableDTO dto = new TimeTableDTO();
        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, student_id);
            rs = pstmt.executeQuery();
            dto = new TimeTableDTO();
            if(rs.next()) {
                dto.setPeriod1beginISO(rs.getString("period1begin"));
                dto.setPeriod1endISO(rs.getString("period1end"));
                dto.setPeriod2beginISO(rs.getString("period2begin"));
                dto.setPeriod2endISO(rs.getString("period2end"));
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return dto;
    }


    public void close(){
        try{
            if(rs != null) rs.close();
            if(pstmt != null) pstmt.close();
            if(conn != null) conn.close();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}
