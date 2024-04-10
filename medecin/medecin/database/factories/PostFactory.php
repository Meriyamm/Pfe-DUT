<?php

namespace Database\Factories;

use App\Http\Resources\User;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Post>
 */
class PostFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition()
    {
        // static $order = 1;
        return [
            'title' => $this->faker->sentence(1),
            'content' => $this->faker->paragraph(3),
            'user_id' => User::randomDigit()->first(),



        ];
    }
}
