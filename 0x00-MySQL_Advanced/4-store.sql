-- creates a trigger that decreases quantity of an item after adding new order
DELIMITER $$
CREATE TRIGGER update_quantity_on_order_insert
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
    UPDATE items
    SET quantity = quantity - new.quantity
    WHERE items.id = new.item_id;
END $$
DELIMITER;
