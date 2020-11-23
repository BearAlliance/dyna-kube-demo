import React from 'react';

const demos = [
  {
    title: 'Request to presentation layer',
    description:
      'This request only goes to the presentation layer, and does not propagate beyond that.',
  },
];

function Demo(demoConfig) {
  const { title, description } = demoConfig;
  return (
    <div>
      <div className="title">{title}</div>
      <div className="subtitle">{description}</div>;
    </div>
  );
}

export function Demos() {
  return (
    <div>
      <h1 className="title">Demos</h1>

      {demos.map((demo) => (
        <Demo demoConfig={demo} />
      ))}
    </div>
  );
}
