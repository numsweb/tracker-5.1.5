

var AllJobs =createReactClass({

    getInitialState() {
        return { jobs: [] }
        },

    componentDidMount() {
        $.getJSON('/api/v1/jobs.json', (response) => { this.setState({ jobs: response }) });
    },

    render() {
        var jobs= this.state.jobs.map((job) => {
            return (
                <div key={job.id}>
                    <h3>{job.company}</h3>
                    <p>{job.recruiter}</p>
                </div>
            )
        });
        return(
            <div> {jobs} </div>
        )
    }

});
