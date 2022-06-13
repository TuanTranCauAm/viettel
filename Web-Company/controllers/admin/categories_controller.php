<?php
require_once('controllers/admin/base_controller.php');
require_once('models/newsarticle.php');

class CategoriesController extends BaseController
{
	function __construct()
	{
		$this->folder = 'categories';
	}

	public function index()
	{
        if (session_id() == "")
            session_start();

        if (!isset($_SESSION["user"])){
            header('Location: index.php?page=main&controller=login&action=index');
        }
        // $news = Newsarticle::getAll(); ///
        // $data = array('news' => $news); ///
        $data = array();
        $this->render('index', $data);
	}
}