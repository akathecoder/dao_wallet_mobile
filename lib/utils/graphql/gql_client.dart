import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:multisig_wallet_with_delegation/constants/keys.dart';

final httpLink = HttpLink(theGraphApiEndpointUri);

ValueNotifier<GraphQLClient> gqlClient = ValueNotifier(
  GraphQLClient(
    link: httpLink,
    cache: GraphQLCache(
      store: HiveStore(),
    ),
  ),
);
