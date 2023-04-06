import { expect, test } from '@playwright/test'

test('一个例子', async ({ page }) => {
  await page.goto('/')
  await expect(page.locator('h1.home')).toHaveText('这些都是i18n和pinia的例子')
})
