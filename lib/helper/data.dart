import 'package:samachar/models/category.dart';

List<CategoryModel> getCategories(){
  List<CategoryModel>  category =  [
      CategoryModel(imageUrl: 'https://images.unsplash.com/photo-1526304640581-d334cdbbf45e?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8ZWNvbm9taWNzfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60', categoryName: 'Economics'),
      CategoryModel(imageUrl:'https://images.unsplash.com/photo-1485400031595-976c74cf4e25?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=750&q=80',categoryName: 'Sports'),
      CategoryModel(imageUrl: 'https://images.unsplash.com/photo-1521791136064-7986c2920216?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=750&q=80',
          categoryName: 'Business'),
      CategoryModel(imageUrl: 'https://images.unsplash.com/photo-1485827404703-89b55fcc595e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=750&q=80',
          categoryName: 'Technology'),
      CategoryModel(imageUrl:'https://images.unsplash.com/photo-1623858437161-90d281564b8f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80',categoryName: 'Food'),
      CategoryModel(imageUrl: 'https://images.unsplash.com/photo-1530973428-5bf2db2e4d71?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80',categoryName: 'Science'),
      CategoryModel(imageUrl: 'https://images.unsplash.com/photo-1506126613408-eca07ce68773?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=431&q=80',categoryName: 'Health'),
      CategoryModel(imageUrl: 'https://images.unsplash.com/photo-1537832816519-689ad163238b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=740&q=80',
      categoryName:'Fashion'),
  ];
  return category;
}
