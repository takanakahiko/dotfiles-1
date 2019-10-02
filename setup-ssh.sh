ssh-keygen -t rsa

# -Kをつけることにより、鍵のpasswordがキーチェーンに保存されるので、
# Macを起動させるたびに、ssh-addしなくてもよくなる
ssh-add -K
