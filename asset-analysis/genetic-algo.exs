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
      cond do
        :rand.uniform() < 0.05 ->
          new_genes = Enum.map(chromosome.genes, &random_weights/1)
          %Chromosome{chromosome | genes: genotype_normalizer(new_genes)}

        true ->
          chromosome
      end
    end)
  end

  defp random_weights(gene) do
    range = floor(gene * 0.5)

    updated_value = gene + Enum.random(-range..range)

    if updated_value <= 0, do: Enum.random(0..2), else: updated_value
  end

  def genotype_normalizer(genes) do
    scaling_factor = 100 / Enum.sum(genes)

    Enum.map(genes, &floor(&1 * scaling_factor))
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
    genes = for _ <- 1..11, do: 0

    genes =
      genes
      |> genotype_randomizer()
      |> Genetic.genotype_normalizer()

    %Chromosome{genes: genes, size: 11}
  end

  defp genotype_randomizer(genes) do
    seed = Enum.random(0..40)
    new_gene = Enum.random(0..seed)
    gene_position = Enum.random(0..(length(genes) - 1))
    old_gene = Enum.at(genes, gene_position)

    cond do
      Enum.sum(genes) + new_gene - old_gene > 100 ->
        genes

      true ->
        genes
        |> List.replace_at(gene_position, new_gene)
        |> genotype_randomizer()
    end
  end

  def fitness_function(chromosome) do
    risk_free_return = 0.04

    st_deviations = [
      0,
      0.000450,
      0.921200,
      0.108631,
      0.000468,
      0.002878,
      0.000053,
      0.000086,
      0.000006,
      0.000666,
      0.001085
    ]

    avg_returns = [
      0.04,
      -0.000054,
      -0.000017,
      -0.000038,
      -0.000110,
      -0.000009,
      -0.000123,
      0.000223,
      -0.000183,
      -0.000142,
      0.000504
    ]

    correlations = %{
      eth: [0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
      uniswap: [
        0,
        0,
        0.618087,
        0.742843,
        0.669962,
        0.643969,
        0.344674,
        -0.195201,
        0.361616,
        -0.511059,
        -0.599811
      ],
      wbtc: [
        0,
        0,
        0,
        0.670761,
        0.188068,
        0.555821,
        -0.118881,
        0.501259,
        0.207885,
        -0.311337,
        0.041636
      ],
      maker: [
        0,
        0,
        0,
        0,
        0.227948,
        0.705858,
        -0.042464,
        0.101900,
        -0.139136,
        -0.744252,
        -0.317326
      ],
      filecoin: [
        0,
        0,
        0,
        0,
        0,
        0.359186,
        0.742797,
        -0.594173,
        0.687426,
        0.013990,
        -0.643986
      ],
      aave: [
        0,
        0,
        0,
        0,
        0,
        0,
        0.267311,
        0.140784,
        0.067580,
        -0.388773,
        -0.174816
      ],
      curve: [
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        -0.606106,
        0.617365,
        0.272188,
        -0.388102
      ],
      nexo: [
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        -0.285172,
        -0.008323,
        0.624863
      ],
      grt: [
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0.486923,
        -0.207457
      ],
      sandclock: [
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0.449937
      ],
      euler: [
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0
      ]
    }

    portfolio_returns = portfolio_returns(avg_returns, chromosome.genes)

    portfolio_st_deviation = portfolio_st_deviation(st_deviations, correlations, chromosome.genes)

    (portfolio_returns - risk_free_return) / portfolio_st_deviation
  end

  def terminate?(_population, generation), do: generation == 100_000

  defp portfolio_returns(avg_returns, genes) do
    avg_returns
    |> Enum.zip(genes)
    |> Enum.map(fn {p, g} -> p * (g / 100) end)
    |> Enum.sum()
  end

  defp portfolio_st_deviation(st_deviations, correlations, genes) do
    assets = [
      :eth,
      :uniswap,
      :wbtc,
      :maker,
      :filecoin,
      :aave,
      :curve,
      :nexo,
      :grt,
      :sandclock,
      :euler
    ]

    part1 =
      st_deviations
      |> Enum.zip(genes)
      |> Enum.map(fn {p, g} -> p ** 2 * (g / 100) ** 2 end)
      |> Enum.sum()

    part2 =
      Enum.reduce(correlations, 0, fn {asset, corrs}, acc ->
        asset_index = Enum.find_index(assets, &(&1 == asset))

        sum =
          corrs
          |> Enum.with_index()
          |> Enum.map(fn {corr, index} ->
            weight1 = Enum.at(genes, asset_index)
            weight2 = Enum.at(genes, index)
            std1 = Enum.at(st_deviations, asset_index)
            std2 = Enum.at(st_deviations, index)

            2 * weight1 * weight2 * corr * std1 * std2
          end)
          |> Enum.sum()

        acc + sum
      end)

    if part1 + part2 <= 0, do: 999, else: :math.sqrt(part1 + part2)
  end
end

soln = Genetic.run(Cargo, population_size: 200)

IO.write("\n")
IO.inspect(soln)

IO.write("\nSharpe Ratio is: #{soln.fitness}\n")
