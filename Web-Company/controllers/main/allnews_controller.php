<?php
require_once('controllers/main/base_controller.php');
require_once('models/newsarticle.php');

class AllnewsController extends BaseController {
    function __construct()
    {
        $this->folder = 'allnews';
    }

    public function index() {
		if (isset($_GET['pg']))
		{
			$pg = $_GET['pg'];
		}
		else 
		{
			$pg = 1;
		}
        $listnews = Newsarticle::get($pg, 5); // 5 articles per page
        $countarticle = Newsarticle::getCountArticle();
        if ($countarticle == 0)
            $numpages = 0;
        else
            $numpages = intdiv($countarticle - 1, 5) + 1;
        $numnews = count($listnews);
        // Get first news of list of news
        if ($numnews == 0) {
            $firstnews = null;
        }
        elseif ($numnews == 1) {
            $firstnews = $listnews[0];
            $listnews = array();
        }
        else {
            $firstnews = $listnews[0];
            $listnews = array_slice($listnews, 1);
        }
        $data = array('firstnews' => $firstnews, 'listnews' => $listnews, 'pg' => $pg, 'numpages' => $numpages);
        $this->render('index', $data);
    }

    public function news() {
        if (isset($_GET['id'])) {
            $newsid = $_GET['id'];
        }
        else { // not given id
            header('Location: index.php?page=main&controller=allnews&action=index'); // redirect to index page
        }
        
        $news = Newsarticle::getArticle($newsid);
        if (is_null($news)) { // not exists article with given id
            header('Location: index.php?page=main&controller=allnews&action=index'); // redirect to index page
        }

        $recentnews = Newsarticle::getRecentnews($news->id, $news->date, 6); // get 6 recent news

        $data = array('news' => $news, 'recentnews' => $recentnews);
        $this->render('news', $data);
    }
}