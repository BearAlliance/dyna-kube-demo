import React, { useState } from 'react';
import classNames from 'classnames';

const demos = [
  {
    title: 'Client => Presentation Layer',
    description:
      'This request only goes to the presentation layer, and does not propagate beyond that.',
    requestUrl: '/api/single-layer',
  },
];

function Demo({ demoConfig }) {
  const { title, description, requestUrl } = demoConfig;

  const [isLoading, setIsLoading] = useState(null);
  const [result, setResult] = useState({});

  function handleClick() {
    setIsLoading(true);

    fetch(requestUrl)
      .then((res) => res.json())
      .then((res) => {
        setResult(res);
        setIsLoading(false);
      })
      .catch((err) => {
        setResult(err);
      });
  }

  return (
    <div className="box">
      <div className="block">
        <div className="title is-4">{title}</div>
        <div> {description}</div>
      </div>

      <div className="block">
        <button
          className={classNames('button', 'is-primary', {
            'is-loading': isLoading,
          })}
          onClick={handleClick}>
          Go!
        </button>
      </div>

      <div className="block">
        <div>Result:</div>
        <pre>{JSON.stringify(result, null, 2)}</pre>
      </div>
    </div>
  );
}

export function Demos() {
  return (
    <div>
      {demos.map((demoConfig) => (
        <div className="section">
          <Demo key={demoConfig.title} demoConfig={demoConfig} />
        </div>
      ))}
    </div>
  );
}
