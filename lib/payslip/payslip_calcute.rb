module Payslip
  class PayslipCalcute

    def initialize(start_date, end_date, super_rate, annual_salary, annual_tax )
      @start_date = start_date.to_date
      @end_date = end_date.to_date
      @super_rate = super_rate
      @annual_salary = annual_salary
      @annual_tax = annual_tax
      @worked_time = worked_time
    end

    def gross_income
      ((@annual_salary.to_f / 12) * @worked_time).round(0).to_i
    end

    def income_tax
      (((@annual_tax.to_f / 12) * @worked_time).round(0)).to_i
    end

    def net_income
      (self.gross_income - self.income_tax).to_i
    end

    def _super
      (self.gross_income * @super_rate).round(0).to_i
    end

    private

    def worked_time
      if first_date_of_month? && last_date_of_month?
        1
      else
        fraction_part_of_month
      end
    end

    def first_date_of_month?
      @start_date == @start_date.at_beginning_of_month
    end

    def last_date_of_month?
      @end_date == @end_date.at_end_of_month
    end

    def fraction_part_of_month
      work_days_in_this_month = @start_date.at_beginning_of_month.business_days_until(@start_date.at_end_of_month)
      worked_days = @start_date.business_days_until(@end_date)
      worked_days.to_f / work_days_in_this_month.to_f
    end

  end
end
