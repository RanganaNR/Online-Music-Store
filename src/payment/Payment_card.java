package payment;

import java.sql.Date;

public class Payment_card {
    private int Card_payment_id; // Primary key
    private String Name;
    private String Address;
    private String Postal_code;
    private double Pay_amount; // Change to match your database column name
    private Date Payment_date; // Change to match your database column name
    private String Card_type; // Change to match your database column name
    private String Card_no; // Change to match your database column name
    private String CVC; // Change to match your database column name
    private Date Expire_date; // Change to match your database column name

    // Constructor
    public Payment_card(int Card_payment_id, String Name, String Address, String Postal_code, double Pay_amount,
                        Date Payment_date, String Card_type, String Card_no, String CVC, Date Expire_date) {
        this.Card_payment_id = Card_payment_id;
        this.Name = Name;
        this.Address = Address;
        this.Postal_code = Postal_code;
        this.Pay_amount = Pay_amount;
        this.Payment_date = Payment_date;
        this.Card_type = Card_type;
        this.Card_no = Card_no; // Keep it as a String to retain the full card number
        this.CVC = CVC;
        this.Expire_date = Expire_date;
    }

    // Getters and Setters
    public int getCard_payment_id() {
        return Card_payment_id;
    }

    public void setCard_payment_id(int Card_payment_id) {
        this.Card_payment_id = Card_payment_id;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public String getPostal_code() {
        return Postal_code;
    }

    public void setPostal_code(String Postal_code) {
        this.Postal_code = Postal_code;
    }

    public double getPay_amount() {
        return Pay_amount;
    }

    public void setPay_amount(double Pay_amount) {
        this.Pay_amount = Pay_amount;
    }

    public Date getPayment_date() {
        return Payment_date;
    }

    public void setPayment_date(Date Payment_date) {
        this.Payment_date = Payment_date;
    }

    public String getCard_type() {
        return Card_type;
    }

    public void setCard_type(String Card_type) {
        this.Card_type = Card_type;
    }

    public String getCard_no() {
        return Card_no;
    }

    public void setCard_no(String Card_no) {
        this.Card_no = Card_no;
    }

    public String getCVC() {
        return CVC;
    }

    public void setCVC(String CVC) {
        this.CVC = CVC;
    }

    public Date getExpire_date() {
        return Expire_date;
    }

    public void setExpire_date(Date Expire_date) {
        this.Expire_date = Expire_date;
    }
}
