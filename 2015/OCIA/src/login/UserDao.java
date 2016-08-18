/*    */ package login;

import dbutil.JdbcUtils;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;



/*     */
/*     */ public class UserDao
/*     */ {

    /*     */
/*     */   public void update(User user) throws Exception
/*     */   {
	System.out.println("++++++");

System.out.println(user.getEmail());

System.out.println(user.getPhone());

    System.out.println(user.getRealname());

    System.out.println(user.getGender());

    System.out.println(user.getMopen());

    System.out.println(user.getOpenfea());

    System.out.println(user.getUsername());
    System.out.println("++++++");
/*  35 */     String sql = "UPDATE user SET email=?,phone=?,realname=?,gender=?,mopen=?,openfea=? WHERE username=?;";
/*  36 */     PreparedStatement pstmt = null;
/*  37 */     JdbcUtils dbc = null;
/*     */     try {
/*  39 */       dbc = new JdbcUtils();
/*  40 */       pstmt = dbc.getConnection().prepareStatement(sql);
System.out.println("++++++");
			
/*  41 */       pstmt.setString(1, user.getEmail());
System.out.println(user.getEmail());
/*  42 */       pstmt.setString(2, user.getPhone());
System.out.println(user.getPhone());
                pstmt.setString(3, user.getRealname());
                System.out.println(user.getRealname());
                pstmt.setString(4, user.getGender());
                System.out.println(user.getGender());
                pstmt.setString(5, user.getMopen());
                System.out.println(user.getMopen());
                pstmt.setString(6, user.getOpenfea());
                System.out.println(user.getOpenfea());
                pstmt.setString(7, user.getUsername());
                System.out.println(user.getUsername());
                System.out.println("++++++");
/*  48 */       pstmt.executeUpdate();
/*  49 */       pstmt.close();
/*     */     } catch (Exception e) {
/*  51 */       e.printStackTrace();
/*     */     }
/*     */     finally {
/*  54 */       dbc.releaseConn();
/*     */     }
/*     */   }

/*     */   public User queryByEmail(String username) throws Exception {
/* 159 */     User user = null;
/* 160 */     String sql = "SELECT email,phone,realname,gender,mopen,openfea FROM user WHERE username=?;";
/* 161 */     PreparedStatement pstmt = null;
/* 162 */     JdbcUtils dbc = null;
/*     */     try {
/* 164 */       dbc = new JdbcUtils();
/* 165 */       pstmt = dbc.getConnection().prepareStatement(sql);
/* 166 */       pstmt.setString(1, username);
/* 167 */       ResultSet rs = pstmt.executeQuery();
/* 168 */       if (rs.next()) {
/* 169 */         user = new User();
/* 170 */         user.setUsername(username);
/* 172 */
                  user.setEmail(rs.getString(1));
                  user.setPhone(rs.getString(2));
                  user.setRealname(rs.getString(3));
/* 176 */         user.setGender(rs.getString(4));
                  user.setMopen(rs.getString(5));
                  user.setOpenfea(rs.getString(6));
/*     */       }
/* 180 */       rs.close();
/* 181 */       pstmt.close();
/*     */     } catch (Exception e) {
/* 183 */       e.printStackTrace();
/*     */     } finally {
/* 185 */       dbc.releaseConn();
/*     */     }
/* 187 */     return user;
/*     */   }
/*     */ }
