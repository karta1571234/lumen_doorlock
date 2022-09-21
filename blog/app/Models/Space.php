<?php

namespace App\Models;

use Illuminate\Support\Facades\DB;

class Space
{
    //顯示各空間-------------------------------------------------------------------------
    public function showAllRoom($area)
    {
        $sql = "SELECT `spaces`.name AS space_name,`classes`.`class_name`,`floors`.`name` AS floor ,`areas`.`name` AS area ,content,doorlock_name,mac,person_number
        FROM `spaces`,`classes`,`area_floor`,`floors`,`areas`
        WHERE spaces.area_floor_id in ( SELECT `area_floor`.`area_floor_id`
                                        FROM `area_floor`,`areas`
                                        WHERE `area_floor`.`area_id`=`areas`.`area_id`
                                        and `areas`.name=? )
        and `spaces`.class_id=`classes`.class_id
        and `area_floor`.`area_floor_id`=`spaces`.`area_floor_id`
        and `floors`.floor_id=`area_floor`.floor_id
        and `areas`.`area_id`=`area_floor`.`area_id`;";
        $arg = array($area);
        $response = DB::select($sql, $arg);
        return $response;
    }
    //顯示可預約空間(空間)------------------------------------------------------
    public function showRooms($area, $floor)
    {
        $sql = "SELECT name,content,class_name,person_number,`spaces`.space_id FROM `spaces`,`area_floor`,`classes` WHERE `area_floor`.`area_floor_id` in
                    (SELECT `area_floor`.`area_floor_id` FROM `area_floor`,`areas`,`floors`
                    WHERE `area_floor`.`area_id`=`areas`.`area_id`
                    and `areas`.`name`=? and `floors`.`name`=?
                    and `floors`.floor_id=`area_floor`.`floor_id`)
                and `spaces`.area_floor_id=`area_floor`.area_floor_id and `classes`.class_id=`spaces`.class_id;";
        $response = DB::select($sql, [$area, $floor]);
        return $response;
    }
    //刪除各空間-----------------------------------------------------------------
    public function removeRoom($space_id)
    {
        $sql = "delete from spaces where space_id=:space_id";
        $response = DB::delete($sql, ['space_id' => $space_id]);
        return $response;
    }
    //新增各空間-----------------------------------------------------------------
    public function newRoom($class_id, $area_id, $floor_id, $name, $content, $doorlock_name, $mac, $doorlock_password)
    {
        $sql = "insert into spaces (name, content, doorlock_name, mac, doorlock_password,class_id,area_floor_id) values (:name, :content, :doorlock_name, :mac, :doorlock_password,:class_id,(SELECT area_floor_id FROM `area_floor` WHERE area_id=:area_id and floor_id=:floor_id))";
        $response = DB::insert($sql, ['name' => $name, 'content' => $content, 'doorlock_name' => $doorlock_name, 'mac' => $mac, 'doorlock_password' => $doorlock_password, 'class_id' => $class_id, 'area_id' => $area_id, 'floor_id' => $floor_id]);
        return $response;
    }
    public function updateSpace($id, $password, $name, $email)
    {
        $sql = "update space set  password=:password, name=:name, email=:email where id=:id";
        $response = DB::update($sql, ['id' => $id, 'name' => $name, 'password' => $password, 'email' => $email]);
        return $response;
    }
    //修改各空間
    public function updateRoom($space_id, $name, $content, $doorlock_name, $mac, $doorlock_password, $class_id, $area_floor_id)
    {
        $sql = "update spaces set name=:name, content=:content, doorlock_name=:doorlock_name, mac=:mac, doorlock_password=:doorlock_password,class_id=:class_id,area_floor_id=:area_floor_id where space_id =:space_id ";
        $response = DB::update($sql, ['space_id' => $space_id, 'name' => $name, 'content' => $content, 'doorlock_name' => $doorlock_name, 'mac' => $mac, 'doorlock_password' => $doorlock_password, 'class_id' => $class_id, 'area_floor_id' => $area_floor_id]);
        return $response;
    }
}
