$filePath = "d:\heyram\Hr\heyram-infrastructure\app\assets\index.js"
$content = [System.IO.File]::ReadAllText($filePath).Replace("`r`n", "`n")

# 1. Inject Data and State at line 98367
$stateInjection = @'
    [lr, cr] = reactExports.useState("job"),
    [page, setPage] = reactExports.useState(1),
    EXTENDED_JOBS = [
      { _id: "ml_eng", jobName: "Machine Learning Engineer (ML)", jobDescription: "Designs and deploys machine learning models for prediction and automation tasks.", minExperience: 0, maxExperience: 1, skills: ["Python", "NumPy", "Pandas", "Scikit-learn", "data preprocessing", "feature engineering", "model evaluation", "basic statistics", "Git"], category: "AI / DATA ROLES", qualification: "B.E/B.Tech/M.Tech/MCA/MSC in CS/IT/Data Science", jobType: "Full-time", location: "Chennai", jobPostedDate: new Date().toISOString() },
      { _id: "dl_eng", jobName: "Deep Learning Engineer (DL)", jobDescription: "Builds neural network models for applications like image recognition and NLP.", minExperience: 0, maxExperience: 1, skills: ["Python", "TensorFlow/PyTorch", "CNN/ANN basics", "model tuning", "data handling", "linear algebra", "debugging"], category: "AI / DATA ROLES", qualification: "B.E/B.Tech/M.Tech/MCA/MSC in CS/IT/AI", jobType: "Full-time", location: "Chennai", jobPostedDate: new Date().toISOString() },
      { _id: "ds", jobName: "Data Scientist", jobDescription: "Analyzes data, builds predictive models, and delivers actionable business insights.", minExperience: 0, maxExperience: 1, skills: ["Python", "Pandas", "statistics", "machine learning basics", "SQL", "data visualization", "EDA"], category: "AI / DATA ROLES", qualification: "Any Graduate with analytical background", jobType: "Full-time", location: "Chennai", jobPostedDate: new Date().toISOString() },
      { _id: "da", jobName: "Data Analyst", jobDescription: "Processes and analyzes data to create reports and dashboards for decision-making.", minExperience: 0, maxExperience: 1, skills: ["Excel", "SQL", "Power BI/Tableau", "data cleaning", "reporting", "basic Python"], category: "AI / DATA ROLES", qualification: "Any Graduate", jobType: "Full-time", location: "Chennai", jobPostedDate: new Date().toISOString() },
      { _id: "de", jobName: "Data Engineer", jobDescription: "Develops data pipelines and manages data infrastructure for efficient processing.", minExperience: 0, maxExperience: 1, skills: ["SQL", "Python", "ETL", "databases", "data warehousing", "basic cloud knowledge"], category: "AI / DATA ROLES", qualification: "B.E/B.Tech in CS/IT", jobType: "Full-time", location: "Chennai", jobPostedDate: new Date().toISOString() },
      { _id: "mern", jobName: "MERN Stack Developer", jobDescription: "Builds full-stack web applications using MongoDB, Express.js, React, and Node.js.", minExperience: 0, maxExperience: 1, skills: ["HTML", "CSS", "JavaScript", "React", "Node.js", "Express.js", "MongoDB", "REST APIs", "Git"], category: "DEVELOPMENT ROLE", qualification: "B.E/B.Tech/MCA", jobType: "Full-time", location: "Chennai", jobPostedDate: new Date().toISOString() },
      { _id: "bpo_exec", jobName: "BPO Executive (Telecom - Multi-Language)", jobDescription: "Handles customer support for telecom services via calls and resolves queries efficiently.", minExperience: 0, maxExperience: 1, skills: ["Tamil + (Telugu/Malayalam/Kannada)", "communication", "customer handling", "problem-solving", "CRM basics"], category: "BPO ROLE", qualification: "Any Graduate", jobType: "Full-time", location: "Chennai", jobPostedDate: new Date().toISOString() },
      { _id: "hr_mkt", jobName: "HR Marketing", jobDescription: "Promotes employer branding to attract talent through campaigns and social platforms.", minExperience: 0, maxExperience: 1, skills: ["Communication", "social media", "branding", "content creation"], category: "HR ROLES", qualification: "MBA/Any Graduate", jobType: "Full-time", location: "Chennai", jobPostedDate: new Date().toISOString() },
      { _id: "hr_rec", jobName: "HR Recruiter", jobDescription: "Handles sourcing, screening, and hiring candidates for various roles.", minExperience: 0, maxExperience: 1, skills: ["Communication", "sourcing", "interview coordination", "negotiation"], category: "HR ROLES", qualification: "MBA/Any Graduate", jobType: "Full-time", location: "Chennai", jobPostedDate: new Date().toISOString() },
      { _id: "mkt_exec", jobName: "Marketing Executive", jobDescription: "Executes marketing strategies across digital and offline channels to increase brand visibility.", minExperience: 0, maxExperience: 1, skills: ["Communication", "campaign planning", "market research", "coordination", "creativity"], category: "MARKETING ROLES", qualification: "Any Graduate", jobType: "Full-time", location: "Chennai", jobPostedDate: new Date().toISOString() },
      { _id: "digi_mkt", jobName: "Digital Marketing Executive", jobDescription: "Manages online campaigns including SEO, social media, and paid advertising.", minExperience: 0, maxExperience: 1, skills: ["SEO", "Google Ads", "social media marketing", "analytics", "keyword research"], category: "MARKETING ROLES", qualification: "Any Graduate", jobType: "Full-time", location: "Chennai", jobPostedDate: new Date().toISOString() },
      { _id: "cont_mkt", jobName: "Content Marketing Executive", jobDescription: "Creates engaging content such as blogs, videos, and social posts to attract audiences.", minExperience: 0, maxExperience: 1, skills: ["Content writing", "SEO basics", "storytelling", "research", "editing"], category: "MARKETING ROLES", qualification: "Any Graduate", jobType: "Full-time", location: "Chennai", jobPostedDate: new Date().toISOString() },
      { _id: "infl_mkt", jobName: "Influencer Marketing Executive", jobDescription: "Coordinates influencer collaborations to promote products and improve reach.", minExperience: 0, maxExperience: 1, skills: ["Communication", "negotiation", "influencer research", "campaign tracking"], category: "MARKETING ROLES", qualification: "Any Graduate", jobType: "Full-time", location: "Chennai", jobPostedDate: new Date().toISOString() },
      { _id: "prod_mkt", jobName: "Product Marketing Executive", jobDescription: "Defines product positioning, messaging, and go-to-market strategies.", minExperience: 0, maxExperience: 1, skills: ["Market research", "communication", "analytical thinking", "customer understanding"], category: "MARKETING ROLES", qualification: "Any Graduate", jobType: "Full-time", location: "Chennai", jobPostedDate: new Date().toISOString() },
      { _id: "brand_mkt", jobName: "Brand Marketing Executive", jobDescription: "Develops and maintains brand identity and awareness across all platforms.", minExperience: 0, maxExperience: 1, skills: ["Branding", "creativity", "communication", "campaign planning"], category: "MARKETING ROLES", qualification: "Any Graduate", jobType: "Full-time", location: "Chennai", jobPostedDate: new Date().toISOString() },
      { _id: "b2b_mkt", jobName: "B2B Marketing Executive", jobDescription: "Markets products/services to businesses through lead generation and relationship management.", minExperience: 0, maxExperience: 1, skills: ["Communication", "lead generation", "CRM basics", "negotiation"], category: "MARKETING ROLES", qualification: "Any Graduate", jobType: "Full-time", location: "Chennai", jobPostedDate: new Date().toISOString() },
      { _id: "b2c_mkt", jobName: "B2C Marketing Executive", jobDescription: "Promotes products directly to customers through campaigns and engagement strategies.", minExperience: 0, maxExperience: 1, skills: ["Customer understanding", "campaign execution", "creativity", "communication"], category: "MARKETING ROLES", qualification: "Any Graduate", jobType: "Full-time", location: "Chennai", jobPostedDate: new Date().toISOString() },
      { _id: "perf_mkt", jobName: "Performance Marketing Executive", jobDescription: "Runs paid campaigns and optimizes them based on data-driven results.", minExperience: 0, maxExperience: 1, skills: ["Google Ads", "Meta Ads", "analytics", "ROI tracking", "A/B testing"], category: "MARKETING ROLES", qualification: "Any Graduate", jobType: "Full-time", location: "Chennai", jobPostedDate: new Date().toISOString() },
      { _id: "guer_mkt", jobName: "Guerrilla Marketing Executive", jobDescription: "Executes creative, unconventional campaigns to generate high audience attention.", minExperience: 0, maxExperience: 1, skills: ["Creative thinking", "innovation", "campaign execution", "audience understanding"], category: "MARKETING ROLES", qualification: "Any Graduate", jobType: "Full-time", location: "Chennai", jobPostedDate: new Date().toISOString() },
    ],
'@
$content = $content.Replace('    [lr, cr] = reactExports.useState("job"),', $stateInjection)

# 2. Update Tab Click Handlers to Reset Page
$content = $content.Replace('onClick: () => mr("job"),', 'onClick: () => { mr("job"); setPage(1); },')
$content = $content.Replace('onClick: () => mr("intern"),', 'onClick: () => { mr("intern"); setPage(1); },')

# 3. Replace Render logic for career_div22
$oldRender = @'
            jsxRuntimeExports.jsxs("div", {
              className: "career_div22",
              children: [
                lr == "job" &&
                  jsxRuntimeExports.jsx(jsxRuntimeExports.Fragment, {
                    children: er.map((kr) =>
                      jsxRuntimeExports.jsx(
                        "div",
                        {
                          className: "career_div22_1",
                          onClick: () => hr(kr),
                          children: jsxRuntimeExports.jsxs("div", {
                            className: "career_div22_2",
                            children: [
                              jsxRuntimeExports.jsxs("div", {
                                className: "career_div22_21",
                                children: [
                                  jsxRuntimeExports.jsx("h1", {
                                    children: kr.jobName,
                                  }),
                                  jsxRuntimeExports.jsxs("p", {
                                    className: "lowercase",
                                    children: [
                                      " ",
                                      kr.minExperience,
                                      " - ",
                                      kr.maxExperience,
                                      " years",
                                    ],
                                  }),
                                  jsxRuntimeExports.jsx("ul", {
                                    children: jsxRuntimeExports.jsxs("li", {
                                      children: [
                                        jsxRuntimeExports.jsx("span", {
                                          style: { fontSize: "0.8rem" },
                                          children: jsxRuntimeExports.jsx(
                                            TbPointFilled,
                                            {}
                                          ),
                                        }),
                                        kr.jobType,
                                      ],
                                    }),
                                  }),
                                ],
                              }),
                              jsxRuntimeExports.jsx("div", {
                                className: "career_div22_22",
                                children: jsxRuntimeExports.jsx("div", {
                                  children: jsxRuntimeExports.jsx(
                                    FaAngleRight,
                                    {}
                                  ),
                                }),
                              }),
                            ],
                          }),
                        },
                        kr._id
                      )
                    ),
                  }),
                lr == "intern" &&
                  jsxRuntimeExports.jsx(jsxRuntimeExports.Fragment, {
                    children: rr.map((kr) =>
                      jsxRuntimeExports.jsx(
                        "div",
                        {
                          className: "career_div22_1",
                          onClick: () => hr(kr),
                          children: jsxRuntimeExports.jsxs("div", {
                            className: "career_div22_2",
                            children: [
                              jsxRuntimeExports.jsxs("div", {
                                className: "career_div22_21",
                                children: [
                                  jsxRuntimeExports.jsx("h1", {
                                    children: kr.internshipName,
                                  }),
                                  jsxRuntimeExports.jsxs("p", {
                                    className: "lowercase gap-2",
                                    children: [" ", kr.duration],
                                  }),
                                  jsxRuntimeExports.jsx("ul", {
                                    children: jsxRuntimeExports.jsxs("li", {
                                      children: [
                                        jsxRuntimeExports.jsx("span", {
                                          style: { fontSize: "0.8rem" },
                                          children: jsxRuntimeExports.jsx(
                                            TbPointFilled,
                                            {}
                                          ),
                                        }),
                                        kr.location,
                                      ],
                                    }),
                                  }),
                                ],
                              }),
                              jsxRuntimeExports.jsx("div", {
                                className: "career_div22_22",
                                children: jsxRuntimeExports.jsx("div", {
                                  children: jsxRuntimeExports.jsx(
                                    FaAngleRight,
                                    {}
                                  ),
                                }),
                              }),
                            ],
                          }),
                        },
                        kr._id
                      )
                    ),
                  }),
              ],
            }),
'@

$newRender = @'
            jsxRuntimeExports.jsxs("div", {
              className: "career_div22",
              style: { display: "flex", flexDirection: "column", alignItems: "center" },
              children: [
                (() => {
                  const allJobs = lr === "job" ? [...er, ...EXTENDED_JOBS] : rr;
                  const totalPages = Math.ceil(allJobs.length / 5);
                  const displayedJobs = allJobs.slice((page - 1) * 5, page * 5);
                  return jsxRuntimeExports.jsxs(jsxRuntimeExports.Fragment, {
                    children: [
                      displayedJobs.map((kr) => jsxRuntimeExports.jsxs("div", {
                        className: "career_div22_1",
                        onClick: () => hr(kr),
                        children: [
                          jsxRuntimeExports.jsxs("div", {
                            className: "requirement-header",
                            children: [
                              jsxRuntimeExports.jsxs("div", {
                                children: [
                                  jsxRuntimeExports.jsx("div", { className: "requirement-category", children: kr.category || "General Role" }),
                                  jsxRuntimeExports.jsx("h1", { className: "requirement-title", children: kr.jobName || kr.internshipName })
                                ]
                              }),
                              jsxRuntimeExports.jsxs("div", { className: "requirement-exp", children: kr.duration || (kr.minExperience + " - " + kr.maxExperience + " Years") })
                            ]
                          }),
                          jsxRuntimeExports.jsx("p", { className: "requirement-desc", children: kr.jobDescription || "Join our team and help us build amazing solutions." }),
                          jsxRuntimeExports.jsx("div", {
                            className: "skills-container",
                            children: (kr.skills || []).map(skill => jsxRuntimeExports.jsx("span", { className: "skill-tag", children: skill }))
                          }),
                          jsxRuntimeExports.jsx("button", { 
                            className: "apply-btn-inline", 
                            onClick: (e) => { e.stopPropagation(); ur(lr === "job" ? `/apply/${kr._id}` : `/internapply/${kr._id}`, { state: kr }); },
                            children: "Apply Now" 
                          })
                        ]
                      }, kr._id)),
                      totalPages > 1 && jsxRuntimeExports.jsxs("div", {
                        className: "pagination-controls",
                        children: [
                          jsxRuntimeExports.jsx("button", { className: "pagination-btn", disabled: page === 1, onClick: (e) => { e.stopPropagation(); setPage(p => p - 1); window.scrollTo(0, 500); }, children: "Previous" }),
                          jsxRuntimeExports.jsxs("span", { className: "pagination-info", children: ["Page ", page, " of ", totalPages] }),
                          jsxRuntimeExports.jsx("button", { className: "pagination-btn", disabled: page === totalPages, onClick: (e) => { e.stopPropagation(); setPage(p => p + 1); window.scrollTo(0, 500); }, children: "Next" })
                        ]
                      })
                    ]
                  });
                })()
              ],
            }),
'@

$content = $content.Replace($oldRender, $newRender)

[System.IO.File]::WriteAllText($filePath, $content)
