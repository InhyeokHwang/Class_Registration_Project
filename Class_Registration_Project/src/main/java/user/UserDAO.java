package user;

import course.SearchDTO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class UserDAO {

    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    public UserDAO()
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


    public int checkType(String user_id){
        String SQL = "SELECT type FROM user WHERE user_id = ?";
        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, user_id);
            rs = pstmt.executeQuery();
            if(rs.next()){
                if(rs.getString(1).equals("student")){
                    return 1;  //학생은 1
                }else if(rs.getString(1).equals("admin")){
                    return 0;  // 어드민은 0
                }else{
                    return -1;  // 데이터베이스 오류
                }
            }
            return -1; // 데이터베이스 오류
        }catch (Exception e) {
            e.printStackTrace();
        }
        return -2; //데이터베이스 오류
    }

    public int login(String user_id, String password)
    {
        String SQL = "SELECT password FROM user WHERE user_id = ?";
        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, user_id);
            rs = pstmt.executeQuery();
            if(rs.next())
            {
                if(rs.getString(1).equals(password))
                {
                    return 1; //로그인 성공
                }
                else
                {
                    return 0; //비밀번호 불일치
                }
            }
            return -1; // 아이디가 없음
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -2; // 데이터베이스 오류
    }


    public int join(UserDTO user)
    {
        String SQL = "INSERT INTO USER VALUES (?, ?, ?, ?, ?)";
        try
        {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, user.getUserID());
            pstmt.setString(2, user.getUserPassword());
            pstmt.setString(3, user.getUserName());
            pstmt.setString(4, user.getUserGender());
            pstmt.setString(5, user.getUserEmail());
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1; // 데이터베이스 오류
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
