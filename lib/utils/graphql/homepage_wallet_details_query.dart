String homepageWalletDetailsQuery = """
query HomepageWalletDetailsQuery(\$signerAddress: String!) {
  wallets(
    where: {signers_: {address: \$signerAddress}}
    orderBy: createdOn
    orderDirection: desc
  ) {
    id
    createdOn
    metadata {
      title
      description
    }
  }
}
""";
