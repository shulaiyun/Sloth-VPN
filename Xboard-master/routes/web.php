<?php

use App\Services\ThemeService;
use App\Services\UpdateService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\File;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

if (!function_exists('render_sloth_frontend')) {
function render_sloth_frontend(Request $request)
{
    if (admin_setting('app_url') && admin_setting('safe_mode_enable', 0)) {
        $requestHost = $request->getHost();
        $configHost = parse_url(admin_setting('app_url'), PHP_URL_HOST);

        if ($requestHost !== $configHost) {
            abort(403);
        }
    }

    $theme = admin_setting('frontend_theme', 'SlothPro');
    $themeService = new ThemeService();

    try {
        if (!$themeService->exists($theme)) {
            if ($theme !== 'SlothPro') {
                Log::warning('Theme not found, switching to default theme', ['theme' => $theme]);
                $theme = 'SlothPro';
                admin_setting(['frontend_theme' => $theme]);
            }
            $themeService->switch($theme);
        }

        if (!$themeService->getThemeViewPath($theme)) {
            throw new Exception('主题视图文件不存在');
        }

        $publicThemePath = public_path('theme/' . $theme);
        if (!File::exists($publicThemePath)) {
            $themePath = $themeService->getThemePath($theme);
            if (!$themePath || !File::copyDirectory($themePath, $publicThemePath)) {
                throw new Exception('主题初始化失败');
            }
            Log::info('Theme initialized in public directory', ['theme' => $theme]);
        }

        $renderParams = [
            'title' => admin_setting('app_name', 'Xboard'),
            'theme' => $theme,
            'version' => app(UpdateService::class)->getCurrentVersion(),
            'description' => admin_setting('app_description', 'Xboard is best'),
            'logo' => admin_setting('logo'),
            'theme_config' => $themeService->getConfig($theme),
            'frontend_context' => [
                'path' => '/' . ltrim($request->path(), '/'),
                'admin_path' => '/' . admin_setting('secure_path', admin_setting('frontend_admin_path', hash('crc32b', config('app.key')))),
                'currency' => admin_setting('currency', 'CNY'),
                'currency_symbol' => admin_setting('currency_symbol', '¥'),
                'downloads' => [
                    'windows' => [
                        'version' => admin_setting('windows_version', ''),
                        'url' => admin_setting('windows_download_url', ''),
                    ],
                    'macos' => [
                        'version' => admin_setting('macos_version', ''),
                        'url' => admin_setting('macos_download_url', ''),
                    ],
                    'android' => [
                        'version' => admin_setting('android_version', ''),
                        'url' => admin_setting('android_download_url', ''),
                    ],
                    'ios' => [
                        'version' => admin_setting('ios_version', ''),
                        'url' => admin_setting('ios_download_url', ''),
                        'guide_title' => admin_setting('ios_guide_title', ''),
                        'guide_url' => admin_setting('ios_guide_url', ''),
                        'guide_markdown' => admin_setting('ios_guide_markdown', ''),
                    ],
                ],
                'operator_path' => '/' . admin_setting('secure_path', admin_setting('frontend_admin_path', hash('crc32b', config('app.key')))) . '/workspace',
            ],
        ];
        return view('theme::' . $theme . '.dashboard', $renderParams);
    } catch (Exception $e) {
        Log::error('Theme rendering failed', [
            'theme' => $theme,
            'error' => $e->getMessage()
        ]);
        abort(500, '主题加载失败');
    }
}
}

Route::get('/', fn(Request $request) => render_sloth_frontend($request));
Route::get('/pricing', fn(Request $request) => render_sloth_frontend($request));
Route::get('/download', fn(Request $request) => render_sloth_frontend($request));
Route::get('/features', fn(Request $request) => render_sloth_frontend($request));
Route::get('/support', fn(Request $request) => render_sloth_frontend($request));
Route::get('/auth/login', fn(Request $request) => render_sloth_frontend($request));
Route::get('/auth/register', fn(Request $request) => render_sloth_frontend($request));
Route::get('/portal', fn(Request $request) => render_sloth_frontend($request));
Route::get('/portal/plans', fn(Request $request) => render_sloth_frontend($request));
Route::get('/portal/subscription', fn(Request $request) => render_sloth_frontend($request));
Route::get('/portal/orders', fn(Request $request) => render_sloth_frontend($request));
Route::get('/portal/downloads', fn(Request $request) => render_sloth_frontend($request));
Route::get('/portal/growth', fn(Request $request) => render_sloth_frontend($request));
Route::get('/portal/help', fn(Request $request) => render_sloth_frontend($request));
Route::get('/portal/support', fn(Request $request) => render_sloth_frontend($request));
Route::get('/portal/invite', fn(Request $request) => render_sloth_frontend($request));
Route::get('/portal/security', fn(Request $request) => render_sloth_frontend($request));
Route::get('/portal/account', fn(Request $request) => render_sloth_frontend($request));

//TODO:: 兼容
Route::get('/' . admin_setting('secure_path', admin_setting('frontend_admin_path', hash('crc32b', config('app.key')))), function () {
    return view('admin', [
        'title' => admin_setting('app_name', 'XBoard'),
        'theme_sidebar' => admin_setting('frontend_theme_sidebar', 'light'),
        'theme_header' => admin_setting('frontend_theme_header', 'dark'),
        'theme_color' => admin_setting('frontend_theme_color', 'default'),
        'background_url' => admin_setting('frontend_background_url'),
        'version' => app(UpdateService::class)->getCurrentVersion(),
        'logo' => admin_setting('logo'),
        'secure_path' => admin_setting('secure_path', admin_setting('frontend_admin_path', hash('crc32b', config('app.key'))))
    ]);
});

Route::get('/' . admin_setting('secure_path', admin_setting('frontend_admin_path', hash('crc32b', config('app.key')))) . '/workspace', function () {
    $securePath = admin_setting('secure_path', admin_setting('frontend_admin_path', hash('crc32b', config('app.key'))));
    return view('operator', [
        'title' => admin_setting('app_name', 'XBoard') . ' Operator Workspace',
        'version' => app(UpdateService::class)->getCurrentVersion(),
        'logo' => admin_setting('logo'),
        'secure_path' => $securePath,
    ]);
});

Route::get('/' . (admin_setting('subscribe_path', 's')) . '/{token}', [\App\Http\Controllers\V1\Client\ClientController::class, 'subscribe'])
    ->middleware('client')
    ->name('client.subscribe');
