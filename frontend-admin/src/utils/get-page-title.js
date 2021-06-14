import defaultSettings from '@/settings'

const title = defaultSettings.title || 'COVID contact tracing system Dashboard'

export default function getPageTitle(pageTitle) {
  if (pageTitle) {
    return `${pageTitle} - ${title}`
  }
  return `${title}`
}
