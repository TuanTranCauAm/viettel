<?php
require_once('connection.php');
class Product
{
    public $id;
    public $type;
    public $name;
    public $price;
    public $description;
    public $content;
    public $img;

    public function __construct($id, $type, $name, $price, $description, $content, $img)
    {
        $this->id = $id;
        $this->type = $type;
        $this->name = $name;
        $this->price = $price;
        $this->description = $description;
        $this->content = $content;
        $this->img = $img;
    }

    static function getAll()
    {
        $db = DB::getInstance();
        $req = $db->query("SELECT * FROM product");
        $products = [];
        foreach ($req->fetch_all(MYSQLI_ASSOC) as $product)
        {
            $products[] = new Product(
                $product['id'],
                $product['type'],
                $product['name'],
                $product['price'],
                $product['description'],
                $product['content'],
                $product['img']
            );
        }
        return $products;
    }

    static function get($id)
    {
        $db = DB::getInstance();
        $req = $db->query("SELECT * FROM product WHERE id = $id");
        $result = $req->fetch_assoc();
        $product = new Product(
            $result['id'],
            $result['type'],
            $result['name'],
            $result['price'],
            $result['description'],
            $result['content'],
            $result['img']
        );
        return $product;
    }

    static function insert($type, $name, $price, $description, $content, $img)
    {
        $db = DB::getInstance();
        $req = $db->query(
            "INSERT INTO product (type, name, price, description, content, img)
            VALUES ('$type', '$name', $price, '$description', '$content', '$img');");
        return $req;
    }

    static function delete($id)
    {
        $db = DB::getInstance();
        $req = $db->query("DELETE FROM product WHERE id = $id");
        return $req;
    }

    static function update($id, $type, $name, $price, $description, $content, $img)
    {
        $db = DB::getInstance();
        $req = $db->query(
            "
                UPDATE product
                SET type = '$type', name = '$name', price = $price, description = '$description', content = '$content', img = '$img'
                WHERE id = $id
            ;");
    }
}
?>