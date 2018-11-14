package dao;

import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.DatatypeConverter;

import model.User;


public class UserDao {

    /**
     * ログインIDとパスワードに紐づくユーザ情報を返す
     * @param loginId
     * @param password
     * @return
     */
    public User findByLoginInfo(String loginId, String password) {
        Connection conn = null;
        try {
            // データベースへ接続
            conn = DBManager.getConnection();

            // SELECT文を準備
            String sql = "SELECT * FROM user WHERE login_id = ? and password = ?";

             // SELECTを実行し、結果表を取得
            PreparedStatement pStmt = conn.prepareStatement(sql);
            pStmt.setString(1, loginId);
            pStmt.setString(2, password);
            ResultSet rs = pStmt.executeQuery();

             // 主キーに紐づくレコードは1件のみなので、rs.next()は1回だけ行う
            if (!rs.next()) {
                return null;
            }

            String loginIdData = rs.getString("login_id");
            String nameData = rs.getString("name");
            return new User(loginIdData, nameData);

        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            // データベース切断
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                    return null;
                }
            }
        }
    }


    //全てのユーザ情報を取得
    public List<User> findAll() {
        Connection conn = null;
        List<User> userList = new ArrayList<User>();

        try {
            // データベースへ接続
            conn = DBManager.getConnection();

            // SELECT文を準備

            String sql = "SELECT * FROM user";
         // TODO: 未実装：管理者以外を取得するようSQLを変更する


             // SELECTを実行し、結果表を取得
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            // 結果表に格納されたレコードの内容を
            // Userインスタンスに設定し、ArrayListインスタンスに追加
            while (rs.next()) {
                int id = rs.getInt("id");
                String loginId = rs.getString("login_id");
                String name = rs.getString("name");
                Date birthDate = rs.getDate("birth_date");
                String password = rs.getString("password");
                String createDate = rs.getString("create_date");
                String updateDate = rs.getString("update_date");
                User user = new User(id, loginId, name, birthDate, password, createDate, updateDate);

                userList.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            // データベース切断
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                    return null;
                }
            }
        }
        return userList;
    }


    //ユーザ詳細情報の為のコード//
	public User info(String id) {
		Connection conn = null;
    	try {
    		 // データベースへ接続
    		 conn = DBManager.getConnection();
    		 //select文用意
    		 String sql = "SELECT * FROM user WHERE id = ?";

    		  PreparedStatement pStmt = conn.prepareStatement(sql);
              pStmt.setString(1, id);
              ResultSet rs = pStmt.executeQuery();

              if (!rs.next()) {
                  return null;
              }

              String loginIdDate = rs.getString("login_id");
              String nameDate = rs.getString("name");
              Date birthDate = rs.getDate("birth_date");
              String createDate = rs.getString("create_date");
              String updateDate = rs.getString("update_date");
              return new User(Integer.parseInt(id), loginIdDate,nameDate,birthDate,null,updateDate, updateDate);

    }	catch (SQLException e) {
        e.printStackTrace();
        return null;
    } finally {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
                return null;
            }
        }
    }
}




	//ユーザ新規登録用のプログラム//
    public User New(String loginId,String password,String name, String birthDate ) throws SQLException{
    	Connection conn = null;
    	try {
    		 // データベースへ接続
    		conn = DBManager.getConnection();
    		// SELECT文を準備
    		String sql = "INSERT INTO user (login_id, password, name, birth_date, create_date,update_date)VALUES (?, ? ,? , ?, now(), now())";

    		PreparedStatement pStmt = conn.prepareStatement(sql);

			pStmt.setString(1, loginId);
			pStmt.setString(2, md5(password));
			pStmt.setString(3, name);
			pStmt.setString(4, birthDate);

 			int result = pStmt.executeUpdate();

    	} catch (SQLException e) {
            e.printStackTrace();
            throw e;
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                    return null;
                 }
            }
        }
		return null;
    }


    //ユーザ情報削除のためのコード。IDを受け取って一致したら削除//
    public void Delete(String id) {

    	Connection conn=null;
    	// データベースへ接続
    	conn=DBManager.getConnection();


    	try {
    		conn=DBManager.getConnection();
    		// DELETE文を準備
    		String sql="DELETE FROM user WHERE id=?";
    		PreparedStatement pStmt=conn.prepareStatement(sql);
    		pStmt.setString(1,id);
    		// DELETE文を実行する
    		pStmt.executeUpdate();


    	}catch(SQLException e) {
    		e.printStackTrace();
    	}finally {
    		// お決まりデータベース切断
    		if (conn!=null) {
    			try {
    				conn.close();
    			}catch(SQLException e){
    				e.printStackTrace();
    			}
    		}
    	}
    }





//ユーザ情報更新用のコード//
public User Update(String password, String name, String birthDate, String id) {
	Connection conn = null;


	try {
		// データベースへ接続
		conn = DBManager.getConnection();
		// UPDATE文を準備
		String sql = "UPDATE user SET password = ?, name = ?, birth_date = ? WHERE id = ?";
		PreparedStatement pStmt = conn.prepareStatement(sql);
		pStmt.setString(1, md5(password));
		pStmt.setString(2, name);
		pStmt.setString(3, birthDate);
		pStmt.setString(4, id);
		// UPDATEを実行
		int result = pStmt.executeUpdate();

	} catch (SQLException e){
        e.printStackTrace();
        return null;
    } finally {
    	// データベース切断(今後使う)
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
                return null;
             }
        }
    }
	return null;
}


public User UpdateNoPassword(String name, String birthDate, String id) {
	Connection conn = null;
	try {
		// データベースへ接続
		conn = DBManager.getConnection();
		// UPDATE文を準備
		String sql = "UPDATE user SET name = ?, birth_date = ? WHERE id = ?";
		PreparedStatement pStmt = conn.prepareStatement(sql);

		pStmt.setString(1, name);
		pStmt.setString(2, birthDate);
		pStmt.setString(3, id);
		// UPDATEを実行
		int result = pStmt.executeUpdate();

	} catch (SQLException e){
        e.printStackTrace();
        return null;
    } finally {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
                return null;
             }
        }
    }
	return null;
}


/*[暗号化するためのメソッド]を作りました
*トライアンドキャッチはEclipseに怒られたのでクリックで追加)
*/
public String md5(String password) {
	//ハッシュを生成したい元の文字列
	String source = password;
	//ハッシュ生成前にバイト配列に置き換える際のCharset
	Charset charset = StandardCharsets.UTF_8;
	//ハッシュアルゴリズム
	String algorithm = "MD5";

	//ハッシュ生成処理
	byte[] bytes = null;
	try {
		bytes = MessageDigest.getInstance(algorithm).digest(source.getBytes(charset));
	} catch (NoSuchAlgorithmException e) {
		e.printStackTrace();
	}
	String result = DatatypeConverter.printHexBinary(bytes);
	return result;
}








//ユーザーの検索:ユーザーリストで使用する用
	public List<User> UserSearch(String loginId, String userName, String dateStart, String dateEnd) {

		Connection conn = null;
		List<User> userList = new ArrayList<User>();
		try {
			// データベースへ接続
			conn = DBManager.getConnection();
			String sql = "SELECT * FROM user WHERE id != 1";

			if(!loginId.equals("")) {
				sql += " AND login_id = '" + loginId + "'";
			}

			if(!userName.equals("")) {
				sql += " AND name LIKE '%" + userName + "%'";
			}

			if(!dateStart.equals("")) {
				sql += " AND birth_date >= '" + dateStart + "'";
			}

			if(!dateEnd.equals("")) {
				sql += " AND birth_date <= '" + dateEnd + "'";
			}

			System.out.println(sql);

			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);

			while(rs.next()) {
				int id = rs.getInt("id");
				String loginId1 = rs.getString("login_id");
				String name = rs.getString("name");
				Date birthDate = rs.getDate("birth_date");
				String password = rs.getString("password");
				String createDate = rs.getString("create_date");
				String updateDate = rs.getString("update_date");
				User user = new User(id, loginId1, name, birthDate, password,createDate,updateDate);
				userList.add(user);
			}

		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			if(conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
					return null;
				}
			}
		}
		return userList;
	}

}



