# Garmin ConnectIQ build action

This action build your ConnectIQ app 

## Inputs

## `device`

**Required** The garmin device_id of the device to build for. Default `"fr165"`.

## `typeCheck`

**Required** The typechecking level to use. 0=off, 1=gradual, 2=informative, 3=strict. Default `"0"`.

## `developerKey`

**Required** The path to the developer_key to use. Remember to **NOT** commit your developer_key plainly into your repository. You can and should store it encrypted in your repository. See [this documentation from](https://docs.github.com/en/actions/security-for-github-actions/security-guides/using-secrets-in-github-actions#storing-large-secrets) github. Default `"./developer_key"`.

## `projectJungle`

**Required** The path to your project.jungle file to export. Default `"./monkey.jungle"`.

## `outputPath`

**Required** The path where to export to. Default `"./out/export.prg"`.

## Outputs

(none)

## Example usage

```
name: Test
run-name: Running tests
on: push

jobs:
  Test-Build:
    runs-on: ubuntu-latest
    environment: production
    steps:
      - name: Checkout repository
        uses: actions/checkout@v4
      - name: Decrypt developer key
        # see https://docs.github.com/en/actions/security-for-github-actions/security-guides/using-secrets-in-github-actions#storing-large-secrets
        run: ./.github/scripts/decrypt_secret.sh
        env:
          INPUT: ./developer_key.gpg
          OUTPUT: ./developer_key
          PASSPHRASE: ${{ secrets.DEVELOPER_KEY_PASSPHRASE }}
      - name: Build
        uses: blackshadev/garmin-connectiq-build-action@8.3.0
        with:
          projectJungle: ./monkey.jungle
          developerKey: ./developer_key
          outputPath: out/app.prg
          device: fr165
          typeCheck: '1'
      - name: Upload release artifacts
        uses: actions/upload-artifact@v4
        with:
          name: wayfinder-${{ github.ref_name }}
          path: out/app.iq
```