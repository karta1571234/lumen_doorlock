<?php

namespace App\Http\Controllers;

use App\Http\Middleware\AuthMiddleware;
use App\Models\Booking as BookingModel;
use Illuminate\Http\Request;

class Booking extends Controller
{
    protected $bookingmodel;
    public function __construct()
    {
        $this->bookingmodel = new BookingModel();
        $this->AM = new AuthMiddleware();
    }

    //顯示個人預約資料------------------------------------------
    public function getAllBooking(Request $request)
    {
        $payload = $this->AM->decodeToken($request);
        $emp_id = $payload->data->emp_id;
        $response['result'] = $this->bookingmodel->showAllBooking($emp_id);
        if (count($response['result']) != 0) {
            $response['status'] = 200;
            $response['message'] = '資料取得成功';
        } else {
            $response['status'] = 204;
            $response['message'] = '資料取得失敗';
        }
        return $response;
    }
    //刪除個人預約紀錄-------------------------------------------
    public function removeBooking(Request $request)
    {
        $booking_id = $request->input("booking_id");
        if ($this->bookingmodel->removeBooking($booking_id) == 1) {
            $response['status'] = 200;
            $response['message'] = '刪除成功';
        } else {
            $response['status'] = 204;
            $response['message'] = '刪除失敗';
        }
        return $response;
    }
    //顯示單一預約紀錄-----------------------------------------------------------
    public function getBooking($booking_id)
    {
        $response['result'] = $this->bookingmodel->getBooking($booking_id);
        if (count($response['result']) != 0) {
            $response['status'] = 200;
            $response['message'] = '資料取得成功';
        } else {
            $response['status'] = 204;
            $response['message'] = '資料取得失敗';
        }
        return $response;
    }
    //修改預約紀錄----------------------------------------------------------------------------------
    public function updateBooking(Request $request)
    {
        $booking_id = $request->input("booking_id");
        $purpose = $request->input("purpose");
        $start_datetime = $request->input('start_datetime');
        $over_datetime = $request->input('over_datetime');
        if ($this->bookingmodel->updateBooking($booking_id, $purpose, $start_datetime, $over_datetime) == 1) {
            $response['status'] = 200;
            $response['message'] = '更新成功';
        } else {
            $response['status'] = 204;
            $response['message'] = '更新失敗';
        }
        return $response;
    }
    //顯示可預約空間---------------------------------------------------------------------------------
    public function getAllAvailableBooking($space_id)
    {
        $response['result'] = $this->bookingmodel->getAllAvailableBooking($space_id);
        if (count($response['result']) != 0) {
            $response['status'] = 200;
            $response['message'] = '資料取得成功';
        } else {
            $response['status'] = 204;
            $response['message'] = '資料取得失敗';
        }
        return $response;
    }
    //新增預約空間---------------------------------------------------------------------------------
    public function newBooking(Request $request)
    {
        // $emp_id = $request->input('emp_id'); //for test

        $payload = $this->AM->decodeToken($request);
        $emp_id = $payload->data->emp_id;
        $space_id = $request->input('space_id');
        $purpose = $request->input('purpose');
        $start_datetime = $request->input('start_datetime');
        $over_datetime = $request->input('over_datetime');

        if ($this->bookingmodel->newBooking($emp_id, $space_id, $purpose, $start_datetime, $over_datetime) == 1) {
            $response['status'] = 200;
            $response['message'] = '新增預約成功';
        } else {
            $response['status'] = 204;
            $response['message'] = '新增預約失敗';
        }
        return $response;
    }
}
