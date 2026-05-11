create extension if not exists pgcrypto;

create table if not exists public.appointments (
  id uuid primary key default gen_random_uuid(),
  owner_name text not null,
  owner_email text not null,
  pet_name text not null,
  species text not null,
  appointment_at timestamptz not null,
  reason text not null,
  notes text,
  status text not null default 'pendiente' check (status in ('pendiente','confirmada','cancelada')),
  created_at timestamptz not null default now()
);

create table if not exists public.clinical_cases (
  id uuid primary key default gen_random_uuid(),
  pet_name text not null,
  owner_name text not null,
  opened_at date not null,
  status text not null default 'Activo',
  assessment text not null,
  plan text not null,
  created_at timestamptz not null default now(),
  created_by uuid references auth.users(id)
);

alter table public.appointments enable row level security;
alter table public.clinical_cases enable row level security;

create policy "public can create appointments"
on public.appointments
for insert
to anon, authenticated
with check (true);

create policy "authenticated can read appointments"
on public.appointments
for select
to authenticated
using (true);

create policy "authenticated can update appointments"
on public.appointments
for update
to authenticated
using (true)
with check (true);

create policy "public can read active appointments"
on public.appointments
for select
to anon
using (status <> 'cancelada');

create policy "authenticated can manage cases"
on public.clinical_cases
for all
to authenticated
using (true)
with check (true);