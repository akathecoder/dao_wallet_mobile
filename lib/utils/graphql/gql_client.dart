import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:multisig_wallet_with_delegation/constants/keys.dart';

final httpLink = HttpLink(theGraphApiEndpointUri);

GraphQLClient gqlClient = GraphQLClient(
  link: httpLink,
  cache: GraphQLCache(
    store: HiveStore(),
  ),
);

ValueNotifier<GraphQLClient> gqlClientValueNotifier = ValueNotifier(
  gqlClient,
);
