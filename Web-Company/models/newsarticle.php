<?php
require_once('connection.php');
class Newsarticle {
    public $id;
    public $status;
    public $thumbnail;
    public $category;
    public $title;
    public $description;
    public $date;
    public $content;
    
    public function __construct($id, $status, $thumbnail, $category, $title, $description, $date, $content = null)
    {
        $this->id = $id;        
        $this->status = $status;
        $this->thumbnail = $thumbnail;
        $this->category = $category;
        $this->title = $title;
        $this->description = $description;
        $this->date = $date;
        $this->content = $content;
    }

    static function get($pagenum, $articleperpage) {
        $db = DB::getInstance();
        $offset = ($pagenum - 1)*$articleperpage;
        $req = $db->query("SELECT ALLNEWS.id as id, status, thumbnail, name as category, title, description, date FROM ALLNEWS, CATEGORYNEWS WHERE status=1 and ALLNEWS.category_id=CATEGORYNEWS.id ORDER BY date DESC LIMIT $offset, $articleperpage");
        $listnews = [];
        foreach ($req->fetch_all(MYSQLI_ASSOC) as $news)
        {
            $listnews[] = new Newsarticle(
                $news["id"],
                $news["status"],
                $news["thumbnail"],
                $news["category"],
                $news["title"],
                $news["description"],
                $news["date"]
            );
        }
        return $listnews;
    }

    static function getArticle($article_id) {
        $db = DB::getInstance();
        $req = $db->query("SELECT ALLNEWS.id as id, status, thumbnail, name as category, title, description, date, content FROM ALLNEWS, CATEGORYNEWS WHERE ALLNEWS.id=$article_id and ALLNEWS.category_id=CATEGORYNEWS.id");
        $news = $req->fetch_assoc();
        $article = new Newsarticle(
            $news["id"],
            $news["status"],
            $news["thumbnail"],
            $news["category"],
            $news["title"],
            $news["description"],
            $news["date"],
            $news["content"]
        );
        return $article;
    }

    static function getCountArticle() {
        $db = DB::getInstance();
        $req = $db->query("SELECT COUNT(*) as countArticle FROM ALLNEWS WHERE status=1");
        $countArticle = $req->fetch_assoc();
        return $countArticle["countArticle"];
    }

    static function getRelatednews($time, $numnews) {
        $numnewsmidLater = intdiv($numnews, 2);
        $numnewsmidEarlier = $numnews - $numnewsmidLater;
        // get the news from database
        $db = DB::getInstance();
        $req1 = $db->query("SELECT ALLNEWS.id as id, status, thumbnail, name as category, title, description, date FROM ALLNEWS, CATEGORYNEWS WHERE ALLNEWS.category_id=CATEGORYNEWS.id and date >= DATE($time) ORDER BY date ASC LIMIT $numnews");
        $req2 = $db->query("SELECT ALLNEWS.id as id, status, thumbnail, name as category, title, description, date FROM ALLNEWS, CATEGORYNEWS WHERE ALLNEWS.category_id=CATEGORYNEWS.id and date < DATE($time) ORDER BY date DESC LIMIT $numnews");

        // convert to array
        if ($req1)  {
            $newsLater = $req1->fetch_all(MYSQLI_ASSOC);
            $numnewsLater = count($newsLater);
        }
        else {
            $newsLater = array();
            $numnewsLater = 0;
        }
        if ($req2) {
            $newsEarlier = $req2->fetch_all(MYSQLI_ASSOC);
            $numnewsEarlier = count($newsEarlier);
        }
        else {
            $newsEarlier = array();
            $numnewsEarlier = 0;
        }

        // choose number of news later and earlier than given time
        if ($numnewsLater >= $numnewsmidLater) {
            $numnewsLater = $numnewsmidLater;
            if ($numnewsEarlier >= $numnewsmidEarlier) {
                $numnewsEarlier = $numnewsmidEarlier;
            }
            else {
                $numnewsLater += $numnewsmidEarlier - $numnewsEarlier;
            }
        }
        else {
            $numnewsEarlier += $numnewsmidLater - $numnewsLater;
        }

        // create list of news
        $newsLater = array_slice($newsLater, 0, $numnewsLater);
        $newsEarlier = array_slice($newsEarlier, 0, $numnewsEarlier);

        $listnews = [];
        foreach (array_merge($newsLater, $newsEarlier) as $news)
        {
            $listnews[] = new Newsarticle(
                $news["id"],
                $news["status"],
                $news["thumbnail"],
                $news["category"],
                $news["title"],
                $news["description"],
                $news["date"]
            );
        }
        return $listnews;
    }
}