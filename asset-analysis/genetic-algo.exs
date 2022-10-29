defmodule Types.Chromosome do
  @type t :: %__MODULE__{
          genes: Enum.t(),
          size: integer(),
          fitness: number(),
          age: integer()
        }

  @enforce_keys :genes
  defstruct [:genes, size: 0, fitness: 0, age: 0]
end

defmodule Genetic do
  alias Types.Chromosome

  def initialize(genotype, opts \\ []) do
    population_size = Keyword.get(opts, :population_size, 100)
    for _ <- 1..population_size, do: genotype.()
  end

  def evaluate(population, fitness_function, _opts \\ []) do
    population
    |> Enum.map(fn chromosome ->
      fitness = fitness_function.(chromosome)
      age = chromosome.age + 1
      %Chromosome{chromosome | fitness: fitness, age: age}
    end)
    |> Enum.sort_by(& &1.fitness, &>=/2)
  end

  def select(population, _opts \\ []) do
    population
    |> Enum.chunk_every(2)
    |> Enum.map(&List.to_tuple(&1))
  end

  def crossover(population, _opts \\ []) do
    population
    |> Enum.reduce(
      [],
      fn {p1, p2}, acc ->
        cx_point = :rand.uniform(length(p1.genes))
        {{h1, t1}, {h2, t2}} = {Enum.split(p1.genes, cx_point), Enum.split(p2.genes, cx_point)}
        {c1, c2} = {%Chromosome{p1 | genes: h1 ++ t2}, %Chromosome{p2 | genes: h2 ++ t1}}
        [c1, c2 | acc]
      end
    )
  end

  def mutation(population, _opts \\ []) do
    population
    |> Enum.map(fn chromosome ->
      if :rand.uniform() < 0.05 do
        %Chromosome{chromosome | genes: Enum.shuffle(chromosome.genes)}
      else
        chromosome
      end
    end)
  end

  def run(problem, opts \\ []) do
    population = initialize(&problem.genotype/0)

    population
    |> evolve(problem, 0, 0, 0, opts)
  end

  def evolve(population, problem, generation, _last_max_fitness, temperature, opts \\ []) do
    population = evaluate(population, &problem.fitness_function/1)
    best = hd(population)
    best_fitness = best.fitness

    IO.write("\rCurrent Best: #{best_fitness}")

    if problem.terminate?(population, generation) do
      best
    else
      generation = generation + 1

      population
      |> select()
      |> crossover()
      |> mutation()
      |> evolve(problem, generation, best_fitness, temperature, opts)
    end
  end
end

defmodule Cargo do
  alias Types.Chromosome

  def genotype do
    genes = for _ <- 1..10, do: Enum.random(0..50)
    %Chromosome{genes: genes, size: 10}
  end

  def fitness_function(chromosome) do
    # profits = [6, 5, 8, 9, 6, 7, 3, 1, 2, 6]
    st_deviation = [1, 0.006410009180618754, 0.004115835276554607]

    avg_returns = [
      0.04,
      -0.00005433328659642472,
      -0.000017478142491588289,
      -0.00003845708719658985,
      -0.00011041406483391978,
      -0.000009056143390544136,
      -0.00012348930535972677,
      0.00022307263698361307,
      -0.00018362343473859146,
      -0.0001427186054860768,
      0.00050453416222847894
    ]

    correlations = %{
      eth: [0, 0, 0],
      uniswap: [0, 1, 0.618087],
      wbtc: [0, 0.618087, 1]
    }

    # weights = [10, 6, 8, 7, 10, 9, 7, 11, 6, 8]
    weight_limit = 100

    cond do
      Enum.sum(chromosome.genes) > weight_limit ->
        0

      true ->
        avg_returns
        |> Enum.zip(chromosome.genes)
        |> Enum.map(fn {p, g} -> p * g end)
        |> Enum.sum()
    end

    # potential_profits =
    #   profits
    #   |> Enum.zip(chromosome.genes)
    #   |> Enum.map(fn {p, g} -> p * g end)
    #   |> Enum.sum()

    # over_limit? =
    #   weights
    #   |> Enum.zip(chromosome.genes)
    #   |> Enum.map(fn {p, g} -> p * g end)
    #   |> Enum.sum()
    #   |> Kernel.>(weight_limit)

    # if over_limit?, do: 0, else: potential_profits
  end

  def terminate?(_population, generation), do: generation == 500_000
end

soln = Genetic.run(Cargo, population_size: 50)

IO.write("\n")
IO.inspect(soln)

weight =
  soln.genes
  |> Enum.zip([10, 6, 8, 7, 10, 9, 7, 11, 6, 8])
  |> Enum.map(fn {g, w} -> w * g end)
  |> Enum.sum()

IO.write("\nWeight is: #{weight}\n")
