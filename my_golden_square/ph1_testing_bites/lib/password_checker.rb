class PasswordChecker
  def check(password)
    password.length >= 8 ? true : (fail "Invalid password, must be 8+ characters.")
  end
end