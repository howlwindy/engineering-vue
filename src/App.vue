<script setup lang="ts">
import { FakerModel, I18nModel, ThemeModel } from '@/models'
import { useGlobalStore } from '@/store'
import { Icon } from '@iconify/vue'
import { ref } from 'vue'

const globalStore = useGlobalStore()

const left = ref<boolean>(true)
const h = ref<number>(0)
</script>
<template>
  <Suspense>
    <QLayout view="hHh lpR fFf">
      <QHeader elevated>
        <div class="flex items-center justify-between">
          <div class="flex items-center">
            <QBtn flat @click="left = !left">
              <Icon class="text-slate-900 dark:text-slate-50" width="30" height="30" :icon="
                left
                  ? 'line-md:menu-to-close-transition'
                  : 'line-md:close-to-menu-transition'
              " />
            </QBtn>
            <div
              class="bg-gradient-to-bl from-pink-500 from-30% via-sky-500 via-50% to-purple-500 to-70% bg-clip-text font-mono text-2xl font-bold text-transparent dark:from-pink-400 dark:from-30% dark:via-sky-400 dark:via-50% dark:to-purple-400 dark:to-70%">
              logo
            </div>
          </div>
          <div class="flex items-center">
            <FakerModel />
            <I18nModel />
            <ThemeModel />
          </div>
        </div>
      </QHeader>
      <QDrawer v-model="left" show-if-above side="left" elevated>
        <QScrollArea class="h-full w-full">
          <p v-for="v of globalStore.faker.sidenav" :key="v">{{ v }}</p>
        </QScrollArea>
      </QDrawer>
      <QPageContainer>
        <QPage padding :style-fn="(offset: number, height: number) => h = height - offset" :style="{ height: `${h}px` }">
          <QScrollArea class="h-full w-full">
            <p v-for="v of globalStore.faker.content" :key="v">{{ v }}</p>
            <RouterView />
          </QScrollArea>
        </QPage>
      </QPageContainer>
    </QLayout>
  </Suspense>
</template>
