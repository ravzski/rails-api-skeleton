def current_setting
  @setting ||= Setting.first_or_create(po_seq: 'P001', so_eq: "S001", payable_seq: 'PY001', receivable_seq: "RE001")
end
