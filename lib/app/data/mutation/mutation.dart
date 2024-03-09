class MutationAPp {


  static String addItemToOrder = """
mutation AddItemToOrder(\$variantId: ID!, \$quantity: Int!) {
  addItemToOrder(productVariantId: \$variantId, quantity: \$quantity) {
    __typename
    ...UpdatedOrder
    ... on ErrorResult {
      errorCode
      message
    }
    ... on InsufficientStockError {
      quantityAvailable
      order {
        ...UpdatedOrder
      }
    }
  }
}

fragment UpdatedOrder on Order {
  id
  code
  state
  totalQuantity
  totalWithTax
  currencyCode
  lines {
    id
    unitPriceWithTax
    quantity
    linePriceWithTax
    productVariant {
      id
      name
       featuredAsset {
        preview
      }
    }
  }
}
""";
}
