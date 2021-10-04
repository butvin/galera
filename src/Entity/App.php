<?php

namespace App\Entity;

use App\Repository\AppRepository;
use Doctrine\ORM\Mapping as ORM;
use Gedmo\Mapping\Annotation\Timestampable;
use Gedmo\Mapping\Annotation\SoftDeleteable;

/**
 * @ORM\Entity(repositoryClass=AppRepository::class)
 */
class App
{

    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private int $id;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private ?string $name;

    /**
     * @ORM\Column(type="string", length=127, unique=true, nullable=false)
     */
    private string $external_id;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(?string $name): self
    {
        $this->name = $name;

        return $this;
    }

    public function getExternalId(): string
    {
        return $this->external_id;
    }

    public function setExternalId(string $external_id): self
    {
        $this->external_id = $external_id;

        return $this;
    }
}
