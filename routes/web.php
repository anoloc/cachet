<?php

/*
 * This file is part of Cachet.
 *
 * (c) Alt Three Services Limited
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

use Illuminate\Support\Facades\Route;

Route::get('/debug-proto', fn () => [
    'x_forwarded_proto' => request()->header('X-Forwarded-Proto'),
    'secure' => request()->secure(),
    'scheme' => request()->getScheme(),
    'headers' => request()->header(),
    'trusted_proxies' => config('cachet.trusted_proxies'),
]);

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

/*Route::get('/', function () {
    return view('welcome');
});*/
