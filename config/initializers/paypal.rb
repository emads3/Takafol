PayPal::SDK.load("config/paypal.yml", Rails.env)
PayPal::SDK.logger = Rails.logger
PayPal::SDK.configure(
    :mode => "sandbox", # "sandbox" or "live"
    :client_id => "Afg_qrS6NABEyAWwWxa28LUcN3kgDOZEt62lIStyGM77_yuDDlEMwojATqmydXWyuslq-c5nU-sv06KM",
    :client_secret => "EGx8rTO7Z-xPqTSfUg43pvRjSBdCbk1VsM5P5l-f1jMSSjZaPZ6tGGtrCygp-XssM7jZRqsqx12wxBFO",
    )
PayPal::SDK.logger.level = Logger::INFO