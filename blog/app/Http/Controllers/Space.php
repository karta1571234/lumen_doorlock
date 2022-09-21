<?php

namespace App\Http\Controllers;

use App\Models\Space as SpaceModel;
use Illuminate\Http\Request;

class Space extends Controller
{
    protected $spacemodel;
    public function __construct()
    {
        $this->spacemodel = new SpaceModel();
    }
    public function getAllRoom($area)
    {
        $response['result'] = $this->spacemodel->showAllRoom($area);
        if (count($response['result']) != 0) {
            $response['status'] = 200;
            $response['message'] = '查詢成功';
        } else {
            $response['status'] = 204;
            $response['message'] = '無查詢結果';
        }
        return $response;
    }
    //顯示各空間-----------------------------------------------------
    public function getRooms($area, $floor)
    {
        $response['result'] = $this->spacemodel->showRooms($area, $floor);
        if (count($response['result']) != 0) {
            $response['status'] = 200;
            $response['message'] = '查詢空間成功';
        } else {
            $response['status'] = 400;
            $response['message'] = '抓取資料失敗或缺少資料';
        }
        return $response;
    }
    //刪除各空間-----------------------------------------------
    public function removeRoom(Request $request)
    {
        $space_id = $request->input("space_id");
        if ($this->spacemodel->removeRoom($space_id) == 1) {
            $response['status'] = 200;
            $response['message'] = '刪除成功';
        } else {
            $response['status'] = 204;
            $response['message'] = '刪除失敗';
        }
        return $response;
    }
    //新增各空間
    public function newRoom(Request $request)
    {
        $class_id = $request->input("class_id");
        $area_id = $request->input("area_id");
        $floor_id = $request->input("floor_id");
        $name = $request->input("name");
        $content = $request->input("content");
        $doorlock_name = $request->input("doorlock_name");
        $mac = $request->input("mac");
        $doorlock_password = $request->input("doorlock_password");

        // $area_floor_id = $request->input("area_floor_id");   insert時順便select area_floor_id才對

        if ($this->spacemodel->newRoom($class_id, $area_id, $floor_id, $name, $content, $doorlock_name, $mac, $doorlock_password) == 1) {
            $response['status'] = 200;
            $response['message'] = '新增空間成功';
        } else {
            $response['status'] = 204;
            $response['message'] = '新增空間失敗';
        }
        return $response;
    }
    //修改各空間
    public function updateRoom(Request $request)
    {
        $space_id = $request->input("space_id");
        $name = $request->input("name");
        $content = $request->input("content");
        $doorlock_name = $request->input("doorlock_name");
        $mac = $request->input("mac");
        $doorlock_password = $request->input("doorlock_password");

        $class_id = $request->input("class_id");
        $area_floor_id = $request->input("area_floor_id");
        if ($this->spacemodel->updateRoom($space_id, $name, $content, $doorlock_name, $mac, $doorlock_password, $class_id, $area_floor_id) == 1) {
            $response['status'] = 200;
            $response['message'] = '更新成功';
        } else {
            $response['status'] = 204;
            $response['message'] = '更新失敗';
        }
        return $response;
    }
}
