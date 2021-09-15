### A Pluto.jl notebook ###
# v0.15.1

using Markdown
using InteractiveUtils

# ╔═╡ d1c4498d-4ca9-4eea-a0d1-5bd60eff8821
begin
	using Pkg; Pkg.add("PyPlot")
	using Plots;gr()
	using LaTeXStrings
	using PlutoUI
end

# ╔═╡ dad84aa1-2705-40d0-87a0-fea5b49c68ee
md"""
## $A_n$ as a function of $a$
"""

# ╔═╡ c35d5180-e19d-11eb-337f-4309ec908881
md"""

$A_n = \dfrac{2bL^2}{a (L - a) n^2 \pi^2} \sin \left(\dfrac{n \pi a}{L} \right)$
"""

# ╔═╡ 32036e45-edf1-4887-b778-ddffdfed715b
md"""
**Constants used:**
"""

# ╔═╡ 5c478b04-857c-4346-93e9-1acd7de93f65
begin
	L = 650
	b = 4
	size = 10
	y(a) = 0
end

# ╔═╡ 75fb5ad4-f4db-4a8c-b663-00e6bfaed677
md"""
#### Graph 1: isolated harmonics
"""

# ╔═╡ d8aa9c96-60cc-47f6-b78d-66c70bedd166
md"""
**Functions to be plotted:**
"""

# ╔═╡ 633628c9-efea-4118-a5a4-8ca55fd19832
begin
	n1(a) = (2*b*L^2)*sin(π*a/L)/(a*(L - a)*π^2)
	n2(a) = (2*b*L^2)*sin(2*π*a/L)/(a*(L - a)*2^2*π^2)
	n3(a) = (2*b*L^2)*sin(3*π*a/L)/(a*(L - a)*3^2*π^2)
end

# ╔═╡ d726ada1-3f5e-4d6b-87fa-acc9b2487356
begin
	p1 = plot(n1, 
		xlims = (0,651), 
		ylims = (-2, 4), 
		xlabel = "a (mm)",
		ylabel = "An(a) (mm)",
		fontfamily = "Helvetica Bold",
		xticks = 0:50:650,
		yticks = -1:1:3,
		w=2,
		label = "n=1", 
		size=(600,500),
		framestyle = :box,
		xtickfontsize=size,
		ytickfontsize=size,
		xguidefontsize=18,
		yguidefontsize=18,
		legendfontsize=13,
		legend = (0.15,0.2),
		foreground_color_legend = nothing,
		dpi=350,
		palette = :tab10,
		linestyle = :solid,
		grid = false
		)
	plot!(n2, 
		w=2, 
		label="n=2",
		linestyle = :dash
	)
	plot!(n3, 
		w=3, 
		label="n=3",
		linestyle = :dashdot
	)
	plot!(y, 
		label= false,
		linestyle = :dash,
		colour = "black"
	)
end

# ╔═╡ 5ffd711b-6e36-445a-a870-c766e41fa8f2
md"""
#### Graph 2: sums of n harmonics, for different values of n
"""

# ╔═╡ 25cdb346-dbab-4079-b46a-829e025050e5
md"""
**Functions to be plotted:**
"""

# ╔═╡ 8e544e29-4457-47d5-a19a-e72211f738a0
begin
	s3(a) = sum((2*b*L^2)*sin(n*π*a/L)/(a*(L - a)*n^2*π^2) for n in 1:3)
	s5(a) = sum((2*b*L^2)*sin(n*π*a/L)/(a*(L - a)*n^2*π^2) for n in 1:5)
	s10(a) = sum((2*b*L^2)*sin(n*π*a/L)/(a*(L - a)*n^2*π^2) for n in 1:10)
	s50(a) = sum((2*b*L^2)*sin(n*π*a/L)/(a*(L - a)*n^2*π^2) for n in 1:50)
end

# ╔═╡ 2a87c736-a093-4a47-98cd-23ec6f4f35bf
begin
	p2 = plot(s3, 
		xlims = (0,651), 
		ylims = (0, 12.01),  
		xlabel = "a (mm)",
		ylabel = "An(a) (mm)",
		fontfamily = "Helvetica Bold",
		xticks = 50:50:650,
		yticks = 0:3:12,
		w=2, 
		label = "until 3rd", 
		size=(600,500), 
		framestyle = :box,
		xtickfontsize=size,
		ytickfontsize=size,
		xguidefontsize=18,
		yguidefontsize=18,
		legendfontsize=13,
		legend = (0.15,0.25),
		foreground_color_legend = nothing,
		dpi=350,
		palette = :tab10,
		linestyle = :solid,
		grid = false
		
	)
	plot!(s5, w=2, label = "until 5th", linestyle = :dash)
	plot!(s10, w=2,  label = "until 10th", linestyle = :dashdot)
	plot!(s50, w=3, label = "until 50th", linestyle = :dot)
end

# ╔═╡ 2c434bcf-b8f2-42b0-b145-3226a541a5d2
md"""
## Graphs of $f(x,t)$
"""

# ╔═╡ c26b4924-73c2-4d70-9fef-c48a40f8567c
md"""

$f(x,t) = \sum_{n=1}^\infty A_n \sin \left( \frac{n \pi x}{L}\right) \cos (\omega_n t - \phi_n)$
"""


# ╔═╡ 9edb2569-44df-4845-bd5e-8f64cc38baf6
md"""
**Constants used:**
"""

# ╔═╡ 59f23614-e7af-466b-bbc0-00586b30567c
begin
	a = 60
	A_1 = (2*b*L^2)*sin(π*a/L)/(a*(L - a)*π^2)
	ω_1 = π/L
end

# ╔═╡ 9d8b21bb-51b1-46ff-ab17-a79dffd227ef
md"""
#### Graph 3: first harmonic, for different values of t
"""

# ╔═╡ 6d11a2ac-2b41-4b42-a5f0-afbe91d0bbbf
md"""
**Functions to be plotted:**
"""

# ╔═╡ e37811ba-c806-4ff0-954e-e041b687b94c
begin
	f1(x) =  A_1*sin(π*x/L)*cos(0)
	f2(x) =  A_1*sin(π*x/L)*cos(2*π*0.25)
	f3(x) =  A_1*sin(π*x/L)*cos(2*π*3/8)
	f4(x) =  A_1*sin(π*x/L)*cos(2*π*0.5)
end

# ╔═╡ 43dec0ff-a7c8-4b86-9fa6-0dbac92d3be9
begin
	p3 = plot(f1, 
		xlims = (0,651), 
		ylims = (-4, 4), 
		xlabel = "x (mm)",
		ylabel = "f(x,t) (mm)",
		fontfamily = "Helvetica Bold", 
		xticks = 0:50:650,
		yticks = -3:1:3,
		w=2,
		label = "t = 0", 
		size=(600,500),
		framestyle = :box,
		xtickfontsize=size,
		ytickfontsize=size,
		xguidefontsize=18,
		yguidefontsize=18,
		legendfontsize=10,
		legend = (0.1,0.2),
		foreground_color_legend = nothing,
		dpi=350,
		palette = :tab10,
		grid = false,
		linestyle = :solid
		)
	plot!(f2, 
		w=2, 
		label="t = L/2c",
		linestyle = :dash
	)
	plot!(f3, 
		w=2, 
		label="t = 3L/4c",
		linestyle = :dashdot
	)
	plot!(f4, 
		w=3, 
		label="t = L/c",
		linestyle = :dot
	)
	#plot!(y, label=false, colour="black", linestyle=:dash)
end

# ╔═╡ a4dddba9-b21a-4edb-a26b-36e88bf99f7a
md"""
#### Graph 4: sums of N harmonics with t=0, for different values of n
"""

# ╔═╡ ff2fd560-c536-4dc7-a719-e85421377c1c
md"""
**Functions to be plotted:**
"""

# ╔═╡ 8213670d-c5f9-4ca4-9c33-a4ecc8ed4834
begin
	g3(x) = sum((2*b*L^2)*sin(n*π*a/L)/(a*(L - a)*n^2*π^2)*sin(n*π*x/L) for n in 1:3)
	g5(x) = sum((2*b*L^2)*sin(n*π*a/L)/(a*(L - a)*n^2*π^2)*sin(n*π*x/L) for n in 1:5)
	g10(x) = sum((2*b*L^2)*sin(n*π*a/L)/(a*(L - a)*n^2*π^2)*sin(n*π*x/L) for n in 1:10)
	g50(x) = sum((2*b*L^2)*sin(n*π*a/L)/(a*(L - a)*n^2*π^2)*sin(n*π*x/L) for n in 1:50)
end

# ╔═╡ 2779cb1e-f6ac-4e4a-b73d-8f2999c4b2bd
begin
	p4 = plot(g3, 
			xlims = (0,651), 
			ylims = (-2, 5), 
			xlabel = "x (mm)",
			ylabel = "f(x,t) (mm)",
			fontfamily = "Helvetica Bold", 
			xticks = 0:50:650,
			yticks = -0:1:4,
			w=2,
			label = "until 3rd",  
			size=(600,500), 
			framestyle = :box,
			tickfontsize=size,
			guidefontsize=18,
			legendfontsize=14,
			legend = (0.80,0.9),
			foreground_color_legend = nothing,
			dpi=350,
			palette = :tab10,
			grid = false,
			linestyle = :solid
			
		)
		plot!(g5, 
			w=2, 
			label="until 5th",
			linestyle = :dash
		)
		plot!(g10, 
			w=2, 
			label="until 10th",
			linestyle = :dashdot
		)
		plot!(g50, 
			w=3, 
			label="until 50th",
			linestyle = :dot
		)
		plot!(y, label=false, colour="black", linestyle=:dash)
end

# ╔═╡ c37553de-f3e0-428c-b07f-b6aaf46e33c5
md"""
**Saving figures**
"""

# ╔═╡ aad18a7b-825d-4321-8c87-44bcb22942f2
begin
	savefig(p1, "an_n_separados.png")
	savefig(p2, "an_n_somas.png")
	savefig(p3, "solucao_n1.png")
	savefig(p4, "solucao_somas.png")
 end

# ╔═╡ 1f1e8574-1ce3-4dbe-af5c-8f7cf3e83b31
md"""
## Simulation of $f(x,t)$ with 50 harmonics
"""

# ╔═╡ 35015f75-7887-4f18-b4f8-ef8c5a4103fc
begin
	j = 240
	s = 50L
	
	p5 = @animate for i in range(0, stop = s, length = j)
	    g(x) = sum((2*b*L^2)*sin(n*π*a/L)* ℯ^(-i*n^3/10000)/(a*(L - a)*n^2*π^2)*sin(n*π*x/L)*cos((n*π/L) *i) for n in 1:50)
	    plot(g, 
			xlims = (0,650),
			ylims = (-40, 40),
			xlabel = "x (mm)",
			ylabel = "f(x,t) (mm)",
			fontfamily = "Helvetica Bold",  
			xticks = 0:50:600,
			yticks = -60:30:60,
			w=2,
			palette = :tab10,
			legend = false
		)
	end
	gif(p5, "oscilacao.gif", fps = 30)
end

# ╔═╡ Cell order:
# ╠═d1c4498d-4ca9-4eea-a0d1-5bd60eff8821
# ╟─dad84aa1-2705-40d0-87a0-fea5b49c68ee
# ╟─c35d5180-e19d-11eb-337f-4309ec908881
# ╟─32036e45-edf1-4887-b778-ddffdfed715b
# ╟─5c478b04-857c-4346-93e9-1acd7de93f65
# ╟─75fb5ad4-f4db-4a8c-b663-00e6bfaed677
# ╟─d8aa9c96-60cc-47f6-b78d-66c70bedd166
# ╟─633628c9-efea-4118-a5a4-8ca55fd19832
# ╟─d726ada1-3f5e-4d6b-87fa-acc9b2487356
# ╟─5ffd711b-6e36-445a-a870-c766e41fa8f2
# ╟─25cdb346-dbab-4079-b46a-829e025050e5
# ╟─8e544e29-4457-47d5-a19a-e72211f738a0
# ╟─2a87c736-a093-4a47-98cd-23ec6f4f35bf
# ╟─2c434bcf-b8f2-42b0-b145-3226a541a5d2
# ╟─c26b4924-73c2-4d70-9fef-c48a40f8567c
# ╟─9edb2569-44df-4845-bd5e-8f64cc38baf6
# ╟─59f23614-e7af-466b-bbc0-00586b30567c
# ╟─9d8b21bb-51b1-46ff-ab17-a79dffd227ef
# ╟─6d11a2ac-2b41-4b42-a5f0-afbe91d0bbbf
# ╟─e37811ba-c806-4ff0-954e-e041b687b94c
# ╟─43dec0ff-a7c8-4b86-9fa6-0dbac92d3be9
# ╟─a4dddba9-b21a-4edb-a26b-36e88bf99f7a
# ╟─ff2fd560-c536-4dc7-a719-e85421377c1c
# ╟─8213670d-c5f9-4ca4-9c33-a4ecc8ed4834
# ╟─2779cb1e-f6ac-4e4a-b73d-8f2999c4b2bd
# ╟─c37553de-f3e0-428c-b07f-b6aaf46e33c5
# ╟─aad18a7b-825d-4321-8c87-44bcb22942f2
# ╟─1f1e8574-1ce3-4dbe-af5c-8f7cf3e83b31
# ╟─35015f75-7887-4f18-b4f8-ef8c5a4103fc
