#!/usr/bin/env bash
set -euo pipefail
REGION="${1:-us-east-1}"

echo "Fetching AWS Config rule compliance in region: $REGION"
aws configservice describe-config-rules --region "$REGION" \
  --query 'ConfigRules[].ConfigRuleName' --output text | tr '\t' '\n' | while read -r rule; do
  [[ -z "$rule" ]] && continue
  status=$(aws configservice get-compliance-details-by-config-rule \
    --config-rule-name "$rule" \
    --compliance-types COMPLIANT NON_COMPLIANT \
    --limit 1 \
    --region "$REGION" \
    --query 'EvaluationResults[0].ComplianceType' --output text 2>/dev/null || true)
  echo "- $rule : ${status:-UNKNOWN}"
done
