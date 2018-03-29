import _ from 'lodash';

export const selectAllPokemon = (state) => {
  return _.values(state.entities.pokemon);
};

export const selectSinglePokemon = (state, pokeId) => {
  return _.values(state.entities.pokemon[pokeId]);
};
