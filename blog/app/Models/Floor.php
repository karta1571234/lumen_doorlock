<?php

namespace App\Models;

use Illuminate\Support\Facades\DB;

class Floor
{
    public function getAllFloors()
    {
        $sql = "SELECT floor_id,name FROM `floors` ORDER BY `floor_id`";
        $response = DB::select($sql);
        return $response;
    }
    public function getFloors($area)
    {
        $sql = "SELECT floors.floor_id ,`floors`.`name` FROM `area_floor`,`areas`,`floors`
        WHERE `area_floor`.`area_id`=`areas`.`area_id`
        and `areas`.`name`=?
        and `floors`.floor_id=`area_floor`.`floor_id`";
        $arg = array($area);
        $response = DB::select($sql, $arg);
        return $response;
    }
}
