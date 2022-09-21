<?php

namespace App\Models;

use Illuminate\Support\Facades\DB;

class Booking
{

    //顯示個人預約紀錄-------------------------------------------------------
    public function showAllBooking($emp_id)
    {
        $sql = "SELECT booking_id, `spaces`.name,`purpose`,`classes`.class_name,`classes`.`person_number`, start_datetime,over_datetime FROM booking,spaces,classes,employee
        WHERE booking.emp_id=employee.emp_id AND booking.emp_id=? and booking.space_id=spaces.space_id and classes.class_id=spaces.class_id ORDER BY booking.over_datetime DESC;";
        $response = DB::select($sql, [$emp_id]);
        return $response;
    }
    //刪除個人預約紀錄--------------------------------------------------------
    public function removeBooking($booking_id)
    {
        $sql = "delete from booking where booking_id=:booking_id";
        $response = DB::delete($sql, ['booking_id' => $booking_id]);
        return $response;
    }
    //顯示單一預約紀錄-----------------------------------------------------------
    public function getBooking($booking_id)
    {
        $sql = "select `spaces`.name,`purpose`,`classes`.class_name,`classes`.`person_number`, start_datetime,over_datetime FROM booking,spaces,classes
                WHERE booking.space_id=spaces.space_id AND booking_id=? and classes.class_id=spaces.class_id;";
        $response = DB::select($sql, [$booking_id]);
        return $response;
    }
    //修改預約紀錄----------------------------------------------------------------------------------
    public function updateBooking($booking_id, $purpose, $start_datetime, $over_datetime)
    {
        $sql = "update booking set  purpose=:purpose, start_datetime=:start_datetime, over_datetime=:over_datetime where booking_id=:booking_id";
        $response = DB::update($sql, ['purpose' => $purpose, 'start_datetime' => $start_datetime, 'over_datetime' => $over_datetime, 'booking_id' => $booking_id]);
        return $response;
    }
    //顯示可預約空間(開始~結束datetime)---------------------------------------------------------------------------------
    public function getAllAvailableBooking($space_id)
    {
        $sql = "select `spaces`.name,`classes`.class_name,`classes`.`person_number`, start_datetime,over_datetime from booking,spaces,classes
                where `spaces`.space_id=`booking`.space_id and `booking`.`space_id`=? and spaces.class_id=classes.class_id";
        $response = DB::select($sql, [$space_id]);
        return $response;
    }
    public function newBooking($emp_id, $space_id, $purpose, $start_datetime, $over_datetime)
    {
        $sql = "insert into booking (emp_id, space_id, purpose, start_datetime, over_datetime) values (:emp_id, :space_id, :purpose, :start_datetime, :over_datetime)";
        $response = DB::insert($sql, ['emp_id' => $emp_id, 'space_id' => $space_id, 'purpose' => $purpose, 'start_datetime' => $start_datetime, 'over_datetime' => $over_datetime]);
        return $response;
    }
}
