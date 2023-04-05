import { devices } from '@playwright/test'
import type { PlaywrightTestConfig } from '@playwright/test'

const config: PlaywrightTestConfig = {
  timeout: 1000 * 60,
  testDir: 'e2e',
  testMatch: /.*\.e2e\.spec\.ts/,
  reporter: [['html', { outputFolder: 'public/reports/e2e' }]],
  use: {
    baseURL: 'http://localhost:8080',
  },
  projects: [
    {
      name: 'Desktop Chrome',
      use: { ...devices['Desktop Chrome'] },
    },
    {
      name: 'Desktop Firefox',
      use: { ...devices['Desktop Firefox'] },
    },
    {
      name: 'Desktop Edge',
      use: { ...devices['Desktop Edge'] },
    },
  ],
}

export default config
