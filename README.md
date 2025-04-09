# 💸 AWS Cost Control Setup (for New Accounts)

This repository provides a simple Bash script to help you **configure cost control and alerts** in a brand-new AWS account using the AWS CLI. It’s especially useful for individuals, students, startups, or teams who want to avoid unexpected billing surprises.

---

## 🚀 What Does This Script Do?

The script:
- Enables Cost Explorer (if required)
- Creates a monthly cost budget (e.g., $100)
- Adds an early warning threshold (e.g., $20)
- Sends you email alerts when thresholds are breached

You can easily customize these thresholds in the script.

---

## 🛠️ AWS Services Involved

| Service             | Purpose                                                                 |
|---------------------|-------------------------------------------------------------------------|
| AWS Budgets         | Defines monthly cost thresholds and usage alarms                        |
| AWS Cost Explorer   | Tracks usage and cost data across services (auto-enabled in new accounts)|
| AWS CloudShell / CLI| Automates the setup without needing manual steps in the AWS Console      |
| AWS SNS (optional)  | Used to send alerts programmatically or trigger actions like shutdowns   |

---

## 📈 Why Budgeting & Alerts Matter

Even small workloads in AWS can result in unexpected charges due to:
- Always-on resources (like EC2, RDS)
- Misconfigured services
- Data transfer costs
- Forgetting to delete unused resources

Setting **budgets and alerts** ensures:
- Early warning on spend
- Accountability
- Cost control for experimentation
- Peace of mind

---

## ✅ Best Practices for AWS Cost Control

- **Set multiple alert thresholds** (e.g., 20%, 50%, 90%)
- **Tag resources** for billing visibility (e.g., `Environment=Dev`)
- **Use budgets per service or linked account** if you're using Organizations
- **Monitor usage regularly** via Cost Explorer or `get-cost-and-usage` CLI
- **Auto-stop dev environments** at night or weekends
- **Use consolidated billing** in Organizations
- **Enable anomaly detection** with AWS Cost Anomaly Detection

---

## 🧰 How To Use This Script

1. Open AWS CloudShell or your local terminal (with AWS CLI configured).
2. Clone this repo:
    ```bash
    git clone https://github.com/yourusername/aws-cost-control-setup.git
    cd aws-cost-control-setup
    ```
3. Edit the email address in `cost-control-setup.sh`:
    ```bash
    nano cost-control-setup.sh
    ```
4. Run the script:
    ```bash
    bash cost-control-setup.sh
    ```
5. **Check your email** and confirm the alert subscription.

---

## 📌 Notes

- This script assumes billing access is enabled for IAM roles.
  - Go to: [AWS Billing Preferences](https://console.aws.amazon.com/billing/home#/account)
  - Under IAM User and Role Access to Billing Information, check "Activate IAM Access"
  - Click Save.
- Email alert setup requires confirmation before alerts start.
- Optional extensions (coming soon!):
  - Auto-shutdown EC2 or RDS on high usage
  - Tag-based budget setup
  - Multi-account Organization budgeting

---

## 🧠 License

MIT License. Use freely and modify responsibly.
