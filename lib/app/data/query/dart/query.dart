
class QueryApp{

  static String allCategory="""
  query{
   collections{
    totalItems
    items{
      id
      name
      slug
      featuredAsset{
        preview
      }
    
    }
    
  }
}
""";



}