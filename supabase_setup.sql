create table if not exists public.user_game_data (
  user_id uuid primary key references auth.users(id) on delete cascade,
  data jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);

alter table public.user_game_data enable row level security;

revoke all on table public.user_game_data from anon;
grant select, insert, update, delete on table public.user_game_data to authenticated;

drop policy if exists "Users can view own game data" on public.user_game_data;
drop policy if exists "Users can insert own game data" on public.user_game_data;
drop policy if exists "Users can update own game data" on public.user_game_data;
drop policy if exists "Users can delete own game data" on public.user_game_data;

create policy "Users can view own game data"
on public.user_game_data for select to authenticated
using ((select auth.uid()) = user_id);

create policy "Users can insert own game data"
on public.user_game_data for insert to authenticated
with check ((select auth.uid()) = user_id);

create policy "Users can update own game data"
on public.user_game_data for update to authenticated
using ((select auth.uid()) = user_id)
with check ((select auth.uid()) = user_id);

create policy "Users can delete own game data"
on public.user_game_data for delete to authenticated
using ((select auth.uid()) = user_id);
