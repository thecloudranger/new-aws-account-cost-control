#!/bin/bash

ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)

# Create Budget
aws budgets create-budget \
  --account-id $ACCOUNT_ID \
  --budget '{
    "BudgetName": "monthly-cost-control",
    "BudgetLimit": {
      "Amount": "100",
      "Unit": "USD"
    },
    "TimeUnit": "MONTHLY",
    "BudgetType": "COST",
    "CostFilters": {},
    "CostTypes": {
      "IncludeTax": true,
      "IncludeSubscription": true,
      "UseAmortized": false
    },
    "TimePeriod": {
      "Start": "'$(date +%Y-%m-01T00:00:00Z)'"
    }
  }'

# Add alert at $20
aws budgets create-notification \
  --account-id $ACCOUNT_ID \
  --budget-name "monthly-cost-control" \
  --notification '{
    "NotificationType": "ACTUAL",
    "ComparisonOperator": "GREATER_THAN",
    "Threshold": 20,
    "ThresholdType": "ABSOLUTE_VALUE"
  }' \
  --subscribers '[
    {
      "SubscriptionType": "EMAIL",
      "Address": "your-email@example.com"
    }
  ]'

echo "✅ Budget and alert configured. Check your email to confirm subscription!"
