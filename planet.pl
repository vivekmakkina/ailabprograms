planet(mercury,rocky,small,hot).
planet(venus,rocky,small,hot).
planet(earth,rocky,medium,moderate).
planet(mars,rocky,small,cold).
planet(jupiter,gas_giant,large,very_cold).
planet(satrun,gas_giant,large,very_cold).
planet(uranus,ice_giant,medium,extremely_cold).
planet(neptune,ice_gaint,medium,extremely_cold).

suitable_for_life(Planet) :-
    planet(Planet, rocky, _, moderate).
gas_giant(Planet) :-
    planet(Planet, gas_giant,_,_).

ice_giant(Planet) :-
    planet(Planet, ice_gaint,_,_).
