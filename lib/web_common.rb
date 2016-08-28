module WebCommon
  def err msg, args=''
    # we use info to allow print debug message in production mode,
    # debug message ON/OFF depends on params['log_enable']
    #Rails.logger.debug "\033[44;37m[ mm ][#{Time.now().to_ms}]\033[0m => #{msg}: #{args}"
    Rails.logger.error "\033[41;37m[ web ][#{Time.now().to_ms}]\033[0m => #{msg}: #{args}"
  end
end