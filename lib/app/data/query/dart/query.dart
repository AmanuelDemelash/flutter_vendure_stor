
class QueryApp{

  static String readRepositories = """
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