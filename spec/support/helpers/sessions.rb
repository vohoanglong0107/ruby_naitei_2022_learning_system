module Helpers
  module Sessions
    def sign_in_as user
      post signin_path, params: {session: {email: user.email,
                                           password: user.password}}
    end
  end
end
