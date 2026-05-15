$path = "d:\heyram\Hr\heyram-infrastructure\app\assets\index.js"
$content = [System.IO.File]::ReadAllText($path)

# 1. Add state and functions
$target1 = '    [page, setPage] = reactExports.useState(1),'
$replacement1 = @'
    [page, setPage] = reactExports.useState(1),
    [showApplyForm, setShowApplyForm] = reactExports.useState(!1),
    [applyFormData, setApplyFormData] = reactExports.useState({ name: "", email: "", phone: "", location: "", position: "", resume: null }),
    [applyFormErrors, setApplyFormErrors] = reactExports.useState({}),
    openApplyForm = (job) => {
      setApplyFormData(prev => ({ ...prev, position: job.jobName || job.internshipName || "" }));
      setShowApplyForm(!0);
    },
    closeApplyForm = () => {
      setShowApplyForm(!1);
      setApplyFormData({ name: "", email: "", phone: "", location: "", position: "", resume: null });
      setApplyFormErrors({});
    },
    handleApplyInputChange = (e) => {
      const { name, value } = e.target;
      setApplyFormData(prev => ({ ...prev, [name]: value }));
      if (applyFormErrors[name]) {
        setApplyFormErrors(prev => {
          const newErrors = { ...prev };
          delete newErrors[name];
          return newErrors;
        });
      }
    },
    handleApplyFileChange = (e) => {
      const file = e.target.files[0];
      setApplyFormData(prev => ({ ...prev, resume: file ? file.name : null }));
      if (applyFormErrors.resume) {
        setApplyFormErrors(prev => {
          const newErrors = { ...prev };
          delete newErrors.resume;
          return newErrors;
        });
      }
    },
    validateApplyForm = () => {
      const errors = {};
      if (!applyFormData.name.trim()) errors.name = "Name is required";
      if (!applyFormData.email.trim()) {
        errors.email = "Email is required";
      } else if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(applyFormData.email)) {
        errors.email = "Invalid email format";
      }
      if (!applyFormData.phone.trim()) {
        errors.phone = "Phone is required";
      } else if (!/^\d{10}$/.test(applyFormData.phone.replace(/[- ]/g, ""))) {
        errors.phone = "Invalid phone number (10 digits required)";
      }
      if (!applyFormData.location.trim()) errors.location = "Location is required";
      if (!applyFormData.position.trim()) errors.position = "Position is required";
      if (!applyFormData.resume) errors.resume = "Resume is required";
      
      setApplyFormErrors(errors);
      return Object.keys(errors).length === 0;
    },
    handleApplySubmit = (e) => {
      e.preventDefault();
      if (validateApplyForm()) {
        const subject = encodeURIComponent(`Job Application: ${applyFormData.position} - ${applyFormData.name}`);
        const body = encodeURIComponent(
          `Candidate Details:\n\n` +
          `Name: ${applyFormData.name}\n` +
          `Email: ${applyFormData.email}\n` +
          `Phone: ${applyFormData.phone}\n` +
          `Location: ${applyFormData.location}\n` +
          `Position: ${applyFormData.position}\n` +
          `Resume: ${applyFormData.resume}\n\n` +
          `Note: Please find the resume attached to this email.`
        );
        const gmailUrl = "https://mail.google.com/mail/?view=cm&fs=1&to=dtharunkrishna65@gmail.com&su=" + subject + "&body=" + body;
        window.open(gmailUrl, "_blank");
        closeApplyForm();
      }
    },
'@

# 2. Update inline Apply Now button
$target2 = '                          jsxRuntimeExports.jsx("button", {
                            className: "apply-btn-inline",
                            onClick: (e) => { e.stopPropagation(); ur(lr === "job" ? `/apply/${kr._id}` : `/internapply/${kr._id}`, { state: kr }); },
                            children: "Apply Now"
                          })'
$replacement2 = '                          jsxRuntimeExports.jsx("button", {
                            className: "apply-btn-inline",
                            onClick: (e) => { e.stopPropagation(); openApplyForm(kr); },
                            children: "Apply Now"
                          })'

# 3. Update job model APPLY button
$target3 = '                          children: jsxRuntimeExports.jsx("button", {
                            onClick: pr,
                            children: "APPLY",
                          }),'
$replacement3 = '                          children: jsxRuntimeExports.jsx("button", {
                            onClick: () => { dr(); openApplyForm(nr); },
                            children: "APPLY",
                          }),'

# 4. Update intern model APPLY button
$target4 = '                          children: jsxRuntimeExports.jsx("button", {
                            onClick: xr,
                            children: "APPLY",
                          }),'
$replacement4 = '                          children: jsxRuntimeExports.jsx("button", {
                            onClick: () => { dr(); openApplyForm(nr); },
                            children: "APPLY",
                          }),'

# 5. Inject Popup JSX
$target5 = '          : null,
      ],
    })'
$replacement5 = @'
          : null,
        jsxRuntimeExports.jsx("div", {
          className: `apply-popup-overlay ${showApplyForm ? "show" : ""}`,
          onClick: closeApplyForm,
          children: jsxRuntimeExports.jsxs("div", {
            className: "apply-popup-content",
            onClick: (e) => e.stopPropagation(),
            children: [
              jsxRuntimeExports.jsx("div", {
                className: "apply-close-icon",
                onClick: closeApplyForm,
                children: jsxRuntimeExports.jsx(IoMdClose, {})
              }),
              jsxRuntimeExports.jsxs("div", {
                className: "apply-popup-header",
                children: [
                  jsxRuntimeExports.jsx("h2", { children: "Apply Now" }),
                  jsxRuntimeExports.jsx("p", { children: "Please fill in the details below to apply" })
                ]
              }),
              jsxRuntimeExports.jsxs("form", {
                onSubmit: handleApplySubmit,
                children: [
                  jsxRuntimeExports.jsxs("div", {
                    className: "apply-form-grid",
                    children: [
                      jsxRuntimeExports.jsxs("div", {
                        className: "apply-form-group",
                        children: [
                          jsxRuntimeExports.jsx("label", { children: "Full Name" }),
                          jsxRuntimeExports.jsx("input", {
                            type: "text",
                            name: "name",
                            placeholder: "Your Name",
                            value: applyFormData.name,
                            onChange: handleApplyInputChange
                          }),
                          applyFormErrors.name && jsxRuntimeExports.jsx("span", { className: "apply-form-error", children: applyFormErrors.name })
                        ]
                      }),
                      jsxRuntimeExports.jsxs("div", {
                        className: "apply-form-group",
                        children: [
                          jsxRuntimeExports.jsx("label", { children: "Email Address" }),
                          jsxRuntimeExports.jsx("input", {
                            type: "email",
                            name: "email",
                            placeholder: "yourname@example.com",
                            value: applyFormData.email,
                            onChange: handleApplyInputChange
                          }),
                          applyFormErrors.email && jsxRuntimeExports.jsx("span", { className: "apply-form-error", children: applyFormErrors.email })
                        ]
                      }),
                      jsxRuntimeExports.jsxs("div", {
                        className: "apply-form-group",
                        children: [
                          jsxRuntimeExports.jsx("label", { children: "Phone Number" }),
                          jsxRuntimeExports.jsx("input", {
                            type: "tel",
                            name: "phone",
                            placeholder: "1234567890",
                            value: applyFormData.phone,
                            onChange: handleApplyInputChange
                          }),
                          applyFormErrors.phone && jsxRuntimeExports.jsx("span", { className: "apply-form-error", children: applyFormErrors.phone })
                        ]
                      }),
                      jsxRuntimeExports.jsxs("div", {
                        className: "apply-form-group",
                        children: [
                          jsxRuntimeExports.jsx("label", { children: "Location" }),
                          jsxRuntimeExports.jsx("input", {
                            type: "text",
                            name: "location",
                            placeholder: "City, State",
                            value: applyFormData.location,
                            onChange: handleApplyInputChange
                          }),
                          applyFormErrors.location && jsxRuntimeExports.jsx("span", { className: "apply-form-error", children: applyFormErrors.location })
                        ]
                      }),
                      jsxRuntimeExports.jsxs("div", {
                        className: "apply-form-group full-width",
                        children: [
                          jsxRuntimeExports.jsx("label", { children: "Position Applying For" }),
                          jsxRuntimeExports.jsxs("select", {
                            name: "position",
                            value: applyFormData.position,
                            onChange: handleApplyInputChange,
                            children: [
                              jsxRuntimeExports.jsx("option", { value: "", children: "Select a position" }),
                              [...er, ...EXTENDED_JOBS, ...rr].map(job => 
                                jsxRuntimeExports.jsx("option", { 
                                  value: job.jobName || job.internshipName, 
                                  children: job.jobName || job.internshipName 
                                }, job._id)
                              )
                            ]
                          }),
                          applyFormErrors.position && jsxRuntimeExports.jsx("span", { className: "apply-form-error", children: applyFormErrors.position })
                        ]
                      }),
                      jsxRuntimeExports.jsxs("div", {
                        className: "apply-form-group full-width",
                        children: [
                          jsxRuntimeExports.jsx("label", { children: "Upload Resume" }),
                          jsxRuntimeExports.jsxs("label", {
                            className: "apply-file-label",
                            children: [
                              jsxRuntimeExports.jsx("span", { children: applyFormData.resume || "Choose file or drag and drop" }),
                              jsxRuntimeExports.jsx("input", {
                                type: "file",
                                style: { display: "none" },
                                onChange: handleApplyFileChange
                              })
                            ]
                          }),
                          applyFormErrors.resume && jsxRuntimeExports.jsx("span", { className: "apply-form-error", children: applyFormErrors.resume }),
                          jsxRuntimeExports.jsx("p", { 
                            style: { fontSize: "0.7rem", color: "#802ed7", marginTop: "0.5rem" }, 
                            children: "* Note: You will need to manually attach this file in Gmail after clicking Submit." 
                          })
                        ]
                      })
                    ]
                  }),
                  jsxRuntimeExports.jsxs("div", {
                    className: "apply-popup-footer",
                    children: [
                      jsxRuntimeExports.jsx("button", {
                        type: "button",
                        className: "apply-cancel-btn",
                        onClick: closeApplyForm,
                        children: "Cancel"
                      }),
                      jsxRuntimeExports.jsx("button", {
                        type: "submit",
                        className: "apply-submit-btn",
                        children: "Submit Application"
                      })
                    ]
                  })
                ]
              })
            ]
          })
        }),
      ],
    })
'@

# Perform replacements
$content = $content.Replace($target1, $replacement1)
$content = $content.Replace($target2, $replacement2)
$content = $content.Replace($target3, $replacement3)
$content = $content.Replace($target4, $replacement4)
$content = $content.Replace($target5, $replacement5)

[System.IO.File]::WriteAllText($path, $content)
