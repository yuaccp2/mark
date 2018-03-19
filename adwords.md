https://developers.google.com/adwords/api/docs/guides/first-api-call#set_up_oauth2_authentication
1.adwords.google.com 用全新邮箱注册账号
https://adwords.google.com/um/Welcome/?sf=mt

2.创建API凭据，OAUTH客户端ID，类型其他
https://console.developers.google.com/
选择API凭据，OAUTH客户端ID，类型其他
获取
clientId = "672624257842-eu1pcnght20hjlmcaihif2uvk7lls7hl.apps.googleusercontent.com"
clientSecret = "R1b04G5MEeaYsRSCkThnF5SB"

3.创建OAuth2 凭证，refreshToken
php examples/Auth/GetRefreshToken.php
输入
创建链接，eg https://accounts.google.com/o/oauth2/v2/auth?response_type=code&access_type=offline&client_id=672624257842-eu1pcng
ht20hjlmcaihif2uvk7lls7hl.apps.googleusercontent.com&redirect_uri=urn%3Aietf%3Awg%3Aoauth%3A2.0%3Aoob&state&scope=
https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fadwords%20
获取到code: 4/AAAeZVY6eVysTsMpdB5SQvAvEq6dY1nr3RIRv4kOys8RoDkH1ZF_FtY

https://accounts.google.com/o/oauth2/auth?client_id=1016181511018-kcmprmug3lumbgmvg3214ddbdcicn676.apps.googleusercontent.com&response_type=code&scope=https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fadwords&redirect_uri=urn:ietf:wg:oauth:2.0:oob&access_type=offline&approval_prompt=auto


4/AAAi4rB7pQUdTigIqbqycbsIum_admOPEHKqQIgJGwi_nA9t8bIOog0
4/AADyax8kzIjciMRksfyEojmKE-LYMGNeZ71NihrkIxBhwy1x9h8iRdk
curl \
  -d code=4/AAA2UsY1iDeu3z-8uPRDY8BIxCS7uwCgelV8GtAHzLxFxWizHsP2C-A \
  -d client_id=672624257842-eu1pcnght20hjlmcaihif2uvk7lls7hl.apps.googleusercontent.com \
  -d client_secret=R1b04G5MEeaYsRSCkThnF5SB \
  -d redirect_uri=urn:ietf:wg:oauth:2.0:oob \
  -d grant_type=authorization_code https://accounts.google.com/o/oauth2/token

  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   527    0   273  100   254    485    451 --:--:-- --:--:-- --:--:--   500{
  "access_token" : "ya29.Glt3BcK85SUSlJ7lgYgkc3L1b6vIyJuasZUnLtY3s6RICdmAJ3Z01w3avaw6nhtMXCoilvpWVngTDuzRfIu_bdbSXIxFb7Mg_xXloTNzLRlw9ZQZdki7_EAfBu9T",
  "expires_in" : 3600,
  "refresh_token" : "1/v12c29gD6ajhap9P7Yjrxk_mCQDTylazk7A1iG3QEpA",
  "token_type" : "Bearer"
}


下载 https://curl.haxx.se/ca/cacert.pem
配置 php.ini 
openssl.cafile="path/SSL/cacert.pem"
