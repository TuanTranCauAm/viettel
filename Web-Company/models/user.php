<?php
require_once('connection.php');
class User
{
    public $phone;
    public $password;
    public $profile_photo;
    public $fname;
    public $lname;
    public $day;
    public $month;
    public $year;
    public $gender;
    public $createAt;
    public $updateAt;

    public function __construct($phone, $profile_photo, $fname, $lname, $day, $month, $year, $gender, $createAt, $updateAt, $password)
    {
        $this->phone = $phone;
        $this->profile_photo = $profile_photo;
        $this->fname = $fname;
        $this->lname = $lname;
        $this->day = $day;
        $this->month = $month;
        $this->year = $year;
        $this->gender = $gender;
        $this->createAt = $createAt;
        $this->updateAt = $updateAt;
        $this->password = $password;
    }
    /*
    static function getAll()
    {
        $db = DB::getInstance();
        $req = $db->query(
            "SELECT *
            FROM user;"
        );
        $users = [];
        foreach($req->fetch_all(MYSQLI_ASSOC) as $user) {
            $users[] = new User(
                $user['email'],
                $user['profile_photo'],
                $user['fname'],
                $user['lname'],
                $user['gender'],
                $user['age'],
                $user['phone'],
                $user['createAt'],
                $user['updateAt'],
                '' // Do not return password
            );
        }
        return $users;
    }
    */
    static function get($phone)
    {
        $db = DB::getInstance();
        $req = $db->query(
            "
            SELECT phone, profile_photo, fname, lname, day, month, year, gender, createAt, updateAt
            FROM user
            WHERE phone = '$phone'
            ;"
        );
        $result = $req->fetch_assoc();
        $user = new User(
            $result['phone'],
            $result['profile_photo'],
            $result['fname'],
            $result['lname'],
            $result['day'],
            $result['month'],
            $result['year'],
            $result['gender'],
            $result['createAt'],
            $result['updateAt'],
            '' // Do not return password
        );
        return $user;
    }

    static function insert($phone, $profile_photo, $password, $fname, $lname, $day, $month, $year, $gender)
    {
        $password = password_hash($password, PASSWORD_DEFAULT);
        $db = DB::getInstance();
        $req = $db->query(
            "
            INSERT INTO user (phone, profile_photo, password, fname, lname, day, month, year, gender, createAt, updateAt)
            VALUES ('$phone', '$profile_photo', '$password','$fname', '$lname', '$day', '$month', '$year', '$gender', NOW(), NOW());
            -- INSERT INTO `USER` (phone, password, fname, lname, day, month, year, gender)
            -- VALUES ('$phone', '$password', '$fname', 'TUAN', 1, 1, 1, 'Nam');
            ");

        return $req;
    }

    static function delete($email)
    {
        $db = DB::getInstance();
        $req = $db->query("DELETE FROM user WHERE email = '$email';");
        return $req;
    }

    static function update($email, $profile_photo, $fname, $lname, $gender, $age, $phone)
    {
        $db = DB::getInstance();
        $req = $db->query(
            "
            UPDATE user
            SET profile_photo = '$profile_photo', fname = '$fname', lname = '$lname', gender = $gender, age = $age, phone = '$phone', updateAt = NOW()
            WHERE email = '$email'
            ;"
        );
        return $req;
    }

    static function validation($phone, $password)
    {
        $db = DB::getInstance();
        $req = $db->query("SELECT * FROM user WHERE phone = '$phone'");
        if (@password_verify($password, $req->fetch_assoc()['password']))
            return true;
        else
            return false;
    }

    static function changePassword($email, $oldpassword, $newpassword)
    {
        if (User::validation($email, $oldpassword)) {
            $password = password_hash($newpassword, PASSWORD_DEFAULT);
            $db = DB::getInstance();
            $req = $db->query(
                "UPDATE user
                SET password = '$password', updateAt = NOW()
                WHERE email = '$email';");
            return $req;
        } else {
            return false;
        }
    }

    static function changePassword_($email, $newpassword)
    {
        $password = password_hash($newpassword, PASSWORD_DEFAULT);
        $db = DB::getInstance();
        $req = $db->query(
            "UPDATE user
            SET password = '$password', updateAt = NOW()
            WHERE email = '$email';");
        return $req;
    }
}

?>