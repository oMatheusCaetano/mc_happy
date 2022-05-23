<?php

namespace App\Http\Controllers;

use App\Models\Orphanage;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class OrphanageController extends Controller
{
    public function index(): JsonResponse
    {
        return response()->json(Orphanage::all());
    }

    public function show(int $id): JsonResponse
    {
        return response()->json(Orphanage::find($id));
    }

    public function store(Request $request): JsonResponse
    {
        return response()->json(Orphanage::create($request->all()), 201);
    }

    public function update(int $id, Request $request): JsonResponse
    {
        return response()->json(
            Orphanage::whereKey($id)->update($request->all())
        );
    }

    public function destroy(int $id, ): JsonResponse
    {
        return response()->json(Orphanage::whereKey($id)->delete());
    }
}
