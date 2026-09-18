#!/bin/bash
npx get-graphql-schema http://127.0.0.1:5001/graphql > lib/graphql/schema.graphql
dart run build_runner build --delete-conflicting-outputs