# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  setup do
    @alice = create(:alice)
    @bob = create(:bob)
    @report = create(:report, user_id: @alice.id, created_at: '2021-01-01 09:00:00')
  end

  test 'Can you edit it?' do
    assert @report.editable?(@alice)
    assert_not @report.editable?(@bob)
  end

  test 'Change the time display.' do
    time = '2021-01-01 09:00:00'
    assert_equal time.to_date, @report.created_on
  end
end
