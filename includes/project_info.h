#pragma once

#include <vector>
#include <set>
#include <string>

struct ProjectInfo
{
    std::vector<std::string> source_files;
    std::vector<std::string> header_files;
    std::vector<std::string> flags;
    
    std::set<std::string> include_dirs;
    std:set<std::string> library;

    std::string project_name;
    std::string compiler;
    
    std::string cpp_standard;

       
};


void scanProject(Project& project)
{
    for (const auto &e : fs::recursive_directory_iterator("."))
    {
        if(e.is_regular_file())
        {
            std::string ext = e.path().extension().string();

            if(ext == ".cpp")
            {
                project.source_files.push_back(e.path().string());
            }
            else if(ext == ".hpp"? || ext == ".h")
            {
                project.header_files.push_back(e.path().string());
                project.insert(entry.path().parent_path().string())
            }
        }
    }
}

    
