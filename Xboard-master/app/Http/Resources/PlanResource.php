<?php


namespace App\Http\Resources;

use App\Models\Plan;
use App\Services\PlanService;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class PlanResource extends JsonResource
{
    private const PRICE_MULTIPLIER = 100;

    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->resource['id'],
            'group_id' => $this->resource['group_id'],
            'name' => $this->resource['name'],
            'tags' => $this->resource['tags'],
            'content' => $this->formatContent(),
            'display_summary' => $this->resolveDisplaySummary(),
            'display_highlights_json' => $this->resolveDisplayHighlights(),
            'display_badge' => $this->resolveDisplayBadge(),
            'display_sort' => $this->resolveDisplaySort(),
            'hidden_reason' => $this->resolveHiddenReason(),
            ...$this->getPeriodPrices(),
            'capacity_limit' => $this->getFormattedCapacityLimit(),
            'transfer_enable' => $this->resource['transfer_enable'],
            'speed_limit' => $this->resource['speed_limit'],
            'device_limit' => $this->resource['device_limit'],
            'show' => (bool) $this->resource['show'],
            'sell' => (bool) $this->resource['sell'],
            'renew' => (bool) $this->resource['renew'],
            'reset_traffic_method' => $this->resource['reset_traffic_method'],
            'sort' => $this->resource['sort'],
            'created_at' => $this->resource['created_at'],
            'updated_at' => $this->resource['updated_at']
        ];
    }

    /**
     * Get transformed period prices using Plan mapping
     *
     * @return array<string, float|null>
     */
    protected function getPeriodPrices(): array
    {
        return collect(Plan::LEGACY_PERIOD_MAPPING)
            ->mapWithKeys(function (string $newPeriod, string $legacyPeriod): array {
                $price = $this->resource['prices'][$newPeriod] ?? null;
                return [
                    $legacyPeriod => $price !== null
                        ? (float) $price * self::PRICE_MULTIPLIER
                        : null
                ];
            })
            ->all();
    }

    /**
     * Get formatted capacity limit value
     *
     * @return int|string|null
     */
    protected function getFormattedCapacityLimit(): int|string|null
    {
        $limit = $this->resource['capacity_limit'];

        return match (true) {
            $limit === null => null,
            $limit <= 0 => __('Sold out'),
            default => (int) $limit,
        };
    }

    /**
     * Format content with template variables
     *
     * @return string
     */
    protected function formatContent(): string
    {
        $content = $this->resource['content'] ?? '';
        
        $replacements = [
            '{{transfer}}' => $this->resource['transfer_enable'],
            '{{speed}}' => $this->resource['speed_limit'] === NULL ? __('No Limit') : $this->resource['speed_limit'],
            '{{devices}}' => $this->resource['device_limit'] === NULL ? __('No Limit') : $this->resource['device_limit'],
            '{{reset_method}}' => $this->getResetMethodText(),
        ];

        return str_replace(
            array_keys($replacements),
            array_values($replacements),
            $content
        );
    }

    /**
     * Get reset method text
     *
     * @return string
     */
    protected function getResetMethodText(): string
    {
        $method = $this->resource['reset_traffic_method'];
        
        if ($method === Plan::RESET_TRAFFIC_FOLLOW_SYSTEM) {
            $method = admin_setting('reset_traffic_method', Plan::RESET_TRAFFIC_MONTHLY);
        }
        return match ($method) {
            Plan::RESET_TRAFFIC_FIRST_DAY_MONTH => __('First Day of Month'),
            Plan::RESET_TRAFFIC_MONTHLY => __('Monthly'),
            Plan::RESET_TRAFFIC_NEVER => __('Never'),
            Plan::RESET_TRAFFIC_FIRST_DAY_YEAR => __('First Day of Year'),
            Plan::RESET_TRAFFIC_YEARLY => __('Yearly'),
            default => __('Monthly')
        };
    }

    protected function cleanDisplayText(string $raw, int $limit = 200): string
    {
        $text = trim((string) preg_replace('/\s+/u', ' ', strip_tags($raw)));
        if ($text === '') return '';
        if (mb_strlen($text) <= $limit) return $text;
        return mb_substr($text, 0, $limit) . '...';
    }

    protected function resolveDisplaySummary(): string
    {
        $summary = (string) ($this->resource['display_summary'] ?? '');
        if (trim($summary) !== '') {
            return $this->cleanDisplayText($summary, 240);
        }
        return $this->cleanDisplayText($this->formatContent(), 240);
    }

    protected function resolveDisplayHighlights(): array
    {
        $raw = $this->resource['display_highlights_json'] ?? $this->resource['display_highlights'] ?? null;
        if (is_array($raw)) {
            return collect($raw)
                ->map(fn($item) => $this->cleanDisplayText((string) $item, 52))
                ->filter()
                ->values()
                ->take(6)
                ->all();
        }
        if (is_string($raw) && trim($raw) !== '') {
            $decoded = json_decode($raw, true);
            if (is_array($decoded)) {
                return collect($decoded)
                    ->map(fn($item) => $this->cleanDisplayText((string) $item, 52))
                    ->filter()
                    ->values()
                    ->take(6)
                    ->all();
            }
            return collect(preg_split('/[\n;|]/u', $raw))
                ->map(fn($item) => $this->cleanDisplayText((string) $item, 52))
                ->filter()
                ->values()
                ->take(6)
                ->all();
        }
        return [];
    }

    protected function resolveDisplayBadge(): ?string
    {
        $badge = (string) ($this->resource['display_badge'] ?? '');
        $badge = trim($badge);
        return $badge === '' ? null : $this->cleanDisplayText($badge, 18);
    }

    protected function resolveDisplaySort(): int
    {
        $displaySort = (int) ($this->resource['display_sort'] ?? 0);
        if ($displaySort > 0) return $displaySort;
        return (int) ($this->resource['sort'] ?? 0);
    }

    protected function resolveHiddenReason(): ?string
    {
        if (!(bool) ($this->resource['show'] ?? true)) return 'hidden';
        if (!(bool) ($this->resource['sell'] ?? true)) return 'sell_disabled';
        $capacity = $this->resource['capacity_limit'] ?? null;
        if ($capacity !== null && (int) $capacity <= 0) return 'capacity_limit';
        return null;
    }
}
