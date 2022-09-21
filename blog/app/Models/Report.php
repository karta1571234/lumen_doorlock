<?php

namespace App\Models;

use Illuminate\Support\Facades\DB;

class Report
{
    //新增回饋----------------------------------------------------------------------------------------
    public function newReport($emp_id, $space_id, $content, $report_time)
    {
        $sql = "insert into report (emp_id, space_id, content, report_time) values (:emp_id, :space_id, :content, :report_time)";
        $response = DB::insert($sql, ['emp_id' => $emp_id, 'space_id' => $space_id, 'content' => $content, 'report_time' => $report_time]);
        return $response;
    }
    //問題回饋管理-------------------------------------------------------------------------------------
    public function getUserReport()
    {
        $sql = "SELECT spaces.name AS room,employee.emp_name,report.report_time,report.content
        FROM spaces,employee,report
        WHERE spaces.space_id =report.space_id
        AND report.emp_id = employee.emp_id;";
        $response = DB::select($sql);
        return $response;
    }
}
