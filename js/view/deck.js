import * as _ from 'lodash';
import Card from './card';
import React from 'react';

export default React.createClass({
  render: function() {
    return (
      <div className="deck">
        {_.map(this.props.main, (item, id) => {
          let card = item.card;
          let count = item.count;
          return (
            <Card info={card}
                  count={count}
                  increment={this.props.increment.bind(null, card)}
                  decrement={this.props.decrement.bind(null, card)} />
          );
        })}
      </div>
    );
  }
});
