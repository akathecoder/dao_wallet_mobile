String transactionsTabQuery = """
query TransactionsTabQuery(\$walletAddress: String!) {
    wallet(id:\$walletAddress){
        id
        erc20Transactions(orderBy: txnId, orderDirection:desc){
            txnId
            to
            contractAddr
            amount
            approval
            disapproval
            txnStatus
            createdBy{
                address
            }
            approvedBy{
                address
            }
            disapprovedBy{
                address
            }
            createdOn
            executedOn
        }
        erc721Transactions(orderBy: txnId, orderDirection:desc){
            txnId
            to
            contractAddr
            tokenId
            approval
            disapproval
            txnStatus
            createdBy{
                address
            }
            approvedBy{
                address
            }
            disapprovedBy{
                address
            }
            createdOn
            executedOn
        }
        erc1155Transactions(orderBy: txnId, orderDirection:desc){
            txnId
            to
            contractAddr
            tokenId
            amount
            approval
            disapproval
            txnStatus
            createdBy{
                address
            }
            approvedBy{
                address
            }
            disapprovedBy{
                address
            }
            createdOn
            executedOn
        }
    }
}
""";