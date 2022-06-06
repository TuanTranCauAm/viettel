<?php
require_once('controllers/main/base_controller.php');
require_once('models/product.php');

class ServicesController extends BaseController
{
	function __construct()
	{
		$this->folder = 'services';
	}

	public function index()
	{
		$products = Product::getAll();
		$data = array('products' => $products);
		$this->render('index', $data);
	}

	public function detail() {
        if (isset($_GET['id'])) {
            $serviceid = $_GET['id'];
        }
        else { // not given id
            header('Location: index.php?page=main&controller=services&action=index'); // redirect to index page
        }
        
        $service = Product::get($serviceid);
        if (is_null($serviceid)) { // not exists article with given id
            header('Location: index.php?page=main&controller=services&action=index'); // redirect to index page
        }
        
        $data = array('service' => $service);
        $this->render('detail', $data);
    }
}
