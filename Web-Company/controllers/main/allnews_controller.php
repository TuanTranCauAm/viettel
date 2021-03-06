<?php
require_once('controllers/main/base_controller.php');
require_once('models/newsarticle.php');

class AllnewsController extends BaseController
{
    function __construct()
    {
        $this->folder = 'allnews';
    }

    public function index()
    {
        if (isset($_GET['pg'])) {
            $pg = $_GET['pg'];
        } else {
            $pg = 1;
        }
        if (isset($_GET['category'])) {
            $categoryId = $_GET['category'];
        } else $categoryId = 0;
        if (isset($_GET['order'])) {
            $order = $_GET['order'];
        } else $order = "DESC";
        $listnews = Newsarticle::get($pg, 5, $categoryId, $order); // 5 articles per page
        $countarticle = Newsarticle::getCountArticle($categoryId);
        if ($countarticle == 0)
            $numpages = 0;
        else
            $numpages = intdiv($countarticle - 1, 5) + 1;
        $numnews = count($listnews);
        // Get first news of list of news
        if ($numnews == 0) {
            $firstnews = null;
        } elseif ($numnews == 1) {
            $firstnews = $listnews[0];
            $listnews = array();
        } else {
            $firstnews = $listnews[0];
            $listnews = array_slice($listnews, 1);
        }
        $categories = Newsarticle::getCategories();
        $data = array('firstnews' => $firstnews, 'listnews' => $listnews, 'pg' => $pg, 'numpages' => $numpages, 'categories' => $categories);
        $this->render('index', $data);
    }

    public function news()
    {
        if (isset($_GET['id'])) {
            $newsid = $_GET['id'];
        } else { // not given id
            header('Location: index.php?page=main&controller=allnews&action=index'); // redirect to index page
        }

        $news = Newsarticle::getArticle($newsid);
        if (is_null($news)) { // not exists article with given id
            header('Location: index.php?page=main&controller=allnews&action=index'); // redirect to index page
        }

        $recentnews = Newsarticle::getRecentnews($news->id, $news->date, 6); // get 6 recent news

        $comments = Newsarticle::getComments($newsid);

        $data = array('news' => $news, 'recentnews' => $recentnews, 'comments' => $comments);
        $this->render('news', $data);
    }

    public function comment()
    {
        if (session_id() == "")
            session_start();
        if (!isset($_SESSION["guest"])){
            header('Location: index.php?page=main&controller=login&action=index');
        }

        if (isset($_POST['newsid'])) {
            $newsid = $_POST['newsid'];
        } else { // not given id
            header('Location: index.php?page=main&controller=allnews&action=index'); // redirect to index page
        }

        $commentcontent = $_POST['commentcontent'];

        Newsarticle::insertComment($newsid, $commentcontent);
        header('Location: index.php?page=main&controller=allnews&action=news&id=' . $newsid);
    }

    public function deletecomment()
    {
        if (session_id() == "")
            session_start();
        if (!isset($_SESSION["guest"])){
            header('Location: index.php?page=main&controller=login&action=index&err=1');
        }

        if (isset($_POST['commentid']) and isset($_POST['userid']) and isset($_POST['newsid'])) {
            $commentid = $_POST['commentid'];
            $userid = $_POST['userid'];
            $newsid = $_POST['newsid'];
        } else { // not given id
            header('Location: index.php?page=main&controller=allnews&action=index&err=2'); // redirect to index page
        }
        if ($_SESSION["guest"] == $userid) {
            Newsarticle::deleteComment($commentid, $userid);
            header('Location: index.php?page=main&controller=allnews&action=news&id=' . $newsid);
        } else {
            header('Location: index.php?page=main&controller=allnews&action=index&err=3'); // redirect to index page
        }
    }
}
