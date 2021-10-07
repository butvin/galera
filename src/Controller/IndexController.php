<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

class IndexController extends AbstractController
{
    public function index(Request $request): Response
    {
        $data = new \DateTime('1988-10-24');
//        $data = new \DateTime();


        return $this->render('index/index.html.twig', [
            'data' => $data
        ]);
    }
}
