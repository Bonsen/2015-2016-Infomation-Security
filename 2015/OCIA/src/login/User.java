
package login;

public class User {
    private String username;
    private String realname;
    private String gender;
    private String mopen;
    private String openfea;
    private String email;
    private String phone;

    public String getUsername() {
        return this.username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getRealname() {
        return this.realname;
    }

    public void setRealname(String realname) {
        this.realname = realname;
    }


    public String getMopen() {
        return this.mopen;
    }

    public void setMopen(String mopen) {
        this.mopen = mopen;
    }

    public String getOpenfea() {
        return this.openfea;
    }

    public void setOpenfea(String openfea) {
        this.openfea = openfea;
    }

    public String getGender() {
        return this.gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getEmail() {
        return this.email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return this.phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}