<?php
require_once('connection.php');
class Archive
{
    public $id;
    public $title;
    public $date;

    public function __construct($id, $title, $date)
    {
        $this->id = $id;
        $this->title = $title;
        $this->date = $date;
    }

    static function getAll()
    {
        $db = DB::getInstance();
        $req = $db->query("SELECT * FROM archive");
        $archives = [];
        foreach ($req->fetch_all(MYSQLI_ASSOC) as $archive)
        {
            $archives[] = new Archive(
                $archive['id'],
                $archive['title'],
                $archive['date']
            );
        }
        return $archives;
    }

}
?>