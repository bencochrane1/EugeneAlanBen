require 'wistia'

Wistia.use_config!(:wistia => {
  :api => {
    # :password => 'a241ff4ca1cd80caf3cfdd54ba65d11426153e1c515227baa9adc3d1bbce4899',
    :password => ENV['WISTIA_API_PASSWORD'],
    # :password => Rails.application.secrets.wistia_key,
    :format => 'json'
  }
})

# Wistia.password = 'a241ff4ca1cd80caf3cfdd54ba65d11426153e1c515227baa9adc3d1bbce4899'