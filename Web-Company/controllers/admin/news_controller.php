<?php
require_once('controllers/admin/base_controller.php');
require_once('models/news.php');
require_once('models/newsarticle.php');


class NewsController extends BaseController
{
	function __construct()
	{
		$this->folder = 'news';
	}

	public function index()
	{
        $news = Newsarticle::getAll();
        $data = array('news' => $news);
        $this->render('index', $data);
	}
    public function add(){
        session_start();
        if (!isset($_SESSION["user"])){
            header('Location: index.php?page=main&controller=login&action=index');
        }
        $description = $_POST['description'];
        $content = $_POST['content'];
        $title = $_POST['title'];
        $thumbnail = $_POST['thumbnail'];
        $categoryid = $_POST['categoryid'];
        $res = Newsarticle::insert($title, $description, $content, $thumbnail, $categoryid);
        if ($res)
            echo "success";
        else
            echo "fail";
    }
    public function edit(){
        $id = $_POST['id'];
        $description = $_POST['description'];
        $content = $_POST['content'];
        $title = $_POST['title'];
        $thumbnail = $_POST['thumbnail'];
        $categoryid = $_POST['categoryid'];
        News::update($id,$title, $description, $content);
        header('Location: index.php?page=admin&controller=news&action=index');
    }
    public function delete(){
        $id = $_POST['id'];
        News::delete($id);
        header('Location: index.php?page=admin&controller=news&action=index');
    }
    public function hide(){
        $id = $_POST['id'];
        News::hide($id);
        header('Location: index.php?page=admin&controller=news&action=index');
    }
}
