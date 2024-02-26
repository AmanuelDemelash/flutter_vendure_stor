class QueryApp {
  static String allCategory = """
  query{
  collections(options: { topLevelOnly: true, }) {
    totalItems
    items {
      id
      slug
      name
      parentId
      featuredAsset {
        id
        preview
      }
    }
  }
}
""";
  static String categoryOfSelectedCollection = """
query GetCollection(\$slug: String!) {
  collection(slug: \$slug) {
    id
    name
    slug
    description
    featuredAsset {
      id
      preview
    }
     children{
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

  static String getCollectionProducts = """
query GetCollectionProducts(\$slug: String!, \$skip: Int, \$take: Int) {
  search(
    input: {
      collectionSlug: \$slug,
      groupByProduct: true,
      skip: \$skip,
      take: \$take }
  ) {
    totalItems
    items {
      productName
      slug
      productAsset {
        id
        preview
      }
      priceWithTax {
        ... on SinglePrice {
          value
        }
        ... on PriceRange {
          min
          max
        }
      }
      currencyCode
    }
  }
}
""";

  static String ProductDetail = """
  query GetProductDetail(\$slug: String!) {
   product(slug: \$slug) {
    id
    name
    description
    featuredAsset {
      id
      preview
    }
    assets {
      id
      preview
    }
    facetValues{
      id
      name
      code
      facet{
        name
      }
    }
    variants {
      id
      name
      sku
      stockLevel
      currencyCode
      price
      priceWithTax
      featuredAsset {
        id
        preview
      }
      assets {
        id
        preview
      }
    }
  }
}

""";
}
