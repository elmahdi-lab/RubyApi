# frozen_string_literal: true

class Transaction < ActiveRecord::Base
  belongs_to :account, foreign_key: :account_id, class_name: 'Account'
  belongs_to :bank, foreign_key: :bank_id, class_name: 'Bank'

  validates :amount, :description, presence: true
  validates_format_of :amount, with: /\A\d+(?:\.\d{0,2})?\z/

  def self.sum_per_account(account)
    where(account_id: account.id).sum(:amount)
  end

  def self.duplicate_per_account(account)
    query = "SELECT t1.* FROM transactions t1
      WHERE EXISTS (
        SELECT 1 FROM transactions t2
        WHERE t2.id <> t1.id
          AND t2.description = t1.description
          AND t2.amount = t1.amount
          AND t2.account_id = ACCOUNT_ID
          AND ABS(strftime('%s', t2.created_at) - strftime('%s', t1.created_at)) <= 60
      );
      ".gsub('ACCOUNT_ID', account.id.to_s)
    find_by_sql(query)
  end
end
