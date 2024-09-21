class Product{
  final String id;
  final String ProductName;
  final String ProductCode;
  final String Img;
  final String UnitPrice;
  final String Quantity;
  final String TotalPrice;
  final String CreatedDate;


  Product(
      {
        required this.id,
        required this.ProductName,
        required this.ProductCode,
        required this.Img,
        required this.UnitPrice,
        required this.Quantity,
        required this.TotalPrice,
        required this.CreatedDate
      }
      );
}