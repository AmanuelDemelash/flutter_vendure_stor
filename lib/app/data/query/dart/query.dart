class QueryApp {
  static String allCategory = """
  query{
   collections{
    totalItems
    items{
      id
      name
      featuredAsset{
        preview
      }
    
    }
    
  }
}
""";

  static String category = """
   query getcategory(\$id: ID!){
  collection(id:\$id){
    id
    name
    slug
    description
    children{
      id
      name
      featuredAsset{
        preview
      }
    }
    productVariants{
      totalItems
      items{
        id
        name
        sku
        facetValues{
          name
          code
        }
        productId
        product{
          id
          name
          featuredAsset{
            preview
          }
        }
        featuredAsset{
          preview
        }
        price
        priceWithTax
        
      }
    }
  }
}

""";
}
