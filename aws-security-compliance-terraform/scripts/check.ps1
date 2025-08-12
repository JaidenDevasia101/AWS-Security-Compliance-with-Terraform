param (
    [string]$Region = "us-east-1"
)

$rules = aws configservice describe-config-rules --region $Region --query "ConfigRules[].ConfigRuleName" --output text
foreach ($rule in $rules -split "`t") {
    if (-not $rule) { continue }
    $status = aws configservice get-compliance-details-by-config-rule `
        --config-rule-name $rule `
        --compliance-types COMPLIANT NON_COMPLIANT `
        --limit 1 `
        --region $Region `
        --query "EvaluationResults[0].ComplianceType" --output text 2>$null
    Write-Host "- $rule : $status"
}
