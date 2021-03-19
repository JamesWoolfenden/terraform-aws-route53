## Decoding new users passwords

```cmd
terraform output password | base64 --decode | keybase pgp decrypt
terraform output -json password  | jq '.value[1]' | base64 --decode | keybase pgp
```

This works fine when its a string but fails when it's a list. TODO:Needs better dev skilz.
