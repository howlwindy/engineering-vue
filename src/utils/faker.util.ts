import { faker } from '@faker-js/faker'

export const uFaker = () => ({
  sidenav: [
    ...new Set(
      Array.from({ length: +faker.random.numeric(2) }, () =>
        faker.address.city()
      )
    ),
  ],
  content: [
    ...new Set(
      Array.from({ length: +faker.random.numeric(2) }, () =>
        faker.name.fullName()
      )
    ),
  ],
})
