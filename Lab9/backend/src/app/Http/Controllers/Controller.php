<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;
/**
 * @OA\Info(
 *      title="Your API Title",
 *      version="1.0.0",
 *      description="Your API Description",
 *      @OA\Contact(
 *          email="your.email@example.com"
 *      ),
 *      @OA\License(
 *          name="MIT License",
 *          url="https://opensource.org/licenses/MIT"
 *      )
 * )
 */
class Controller extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;
}