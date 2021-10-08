<?php

declare(strict_types=1);

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

class AppController extends AbstractController
{
    final public function index(Request $request): Response
    {
        return $this->render('app/index.html.twig', [
            'data' => $request,
        ]);
    }
}
