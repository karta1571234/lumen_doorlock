<?php
namespace App\Models;

use Illuminate\Support\Facades\DB;

class RoomRecord
{
    //顯示開門紀錄--------------------------------------------------------------
    public function getRoomRecord($area, $floor, $room)
    {
        $sql = "SELECT spaces.name AS room, enter.enter_person,enter.enter_time
        FROM spaces,enter
        WHERE enter.space_id IN(SELECT spaces.space_id
                                FROM spaces,area_floor,areas,floors
                                WHERE area_floor.area_id = areas.area_id
                                AND area_floor.floor_id = floors.floor_id
                                AND areas.name=?
                                AND floors.name=?
                                AND spaces.name=?
                                AND area_floor.area_floor_id = spaces.area_floor_id)
        AND spaces.space_id = enter.space_id;";
        $response = DB::select($sql, [$area, $floor, $room]);
        return $response;
    }
}
?>