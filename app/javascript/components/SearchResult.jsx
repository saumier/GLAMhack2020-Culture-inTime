import React from 'react';

export default ({ result }) => (
  <a className="item" href={`/productions/${result.id}`}>
    <div className="middle aligned content">
      <div className="header">{result.label}</div>
      <div className="extra">
      <div className="ui label">
            <i className="green arrow alternate circle down outline icon"></i>
            {result.location_label}
          </div>
         <span className="meta">{result.locality}, {result.country}</span> 
         </div>
    </div>
  </a>
);
