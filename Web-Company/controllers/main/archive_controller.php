<?php
require_once('controllers/main/base_controller.php');
require_once('models/archive.php');
class ArchiveController extends BaseController
{
	function __construct()
	{
		$this->folder = 'archive';
	}

	public function index()
	{
		$archives = Archive::getAll();
		$data = array('archives' => $archives);
		$this->render('index', $data);
	}
}
