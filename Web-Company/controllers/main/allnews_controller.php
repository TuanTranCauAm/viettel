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
        $numpages = Newsarticle::getCountArticle();
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
        $data = array('firstnews' => $firstnews, 'listnews' => $listnews, 'numpages' => $numpages);
        $this->render('index', $data);
    }
}