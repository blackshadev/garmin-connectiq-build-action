# Garmin ConnectIQ release action

This action exports your ConnectIQ app ready for uploading to the Garmin's ConnectIQ apps store.  

## Inputs

## `developerKey`

**Required** The path to the developer_key to use. Remember to **NOT** commit your developer_key plainly into your repository. You can and should store it encrypted in your repository. See [this documentation from](https://docs.github.com/en/actions/security-for-github-actions/security-guides/using-secrets-in-github-actions#storing-large-secrets) github. Default `"./developer_key"`.

## `projectJungle`

**Required** The path to your project.jungle file to export. Default `"./out/export.iq"`.

## `outputPath`

**Required** The path where to export to. `"./developer_key"`.

## Outputs

(none)

## Example usage

```
name: Release
run-name: ${{ github.actor }} is releasing 🚀
on: 
  push:
    tags:
      - '*'

jobs:
  Create-Release:
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
      - name: Create release
        uses: blackshadev/garmin-connectiq-release-action@1.0.1
        with:
          projectJungle: ./monkey.jungle
          developerKey: ./developer_key
          outputPath: out/app.iq
      - name: Upload release artifacts
        uses: actions/upload-artifact@v4
        with:
          name: wayfinder-${{ github.ref_name }}
          path: out/app.iq
```