//
//  ViewController.swift
//  DogScheduler
//
//  Created by Samuel Tse on 11/10/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    //my dog owner is id: 1
    var ownerId = 1
    var owner: Owner?
    var dogs = [Dog]()
    var friends = [Int]()
    var enemies = [Int]()
    var schedule : [Schedule] = []
    
    let dateformatter : DateFormatter = {
        var dateformat = DateFormatter()
        dateformat.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateformat.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        dateformat.timeZone = TimeZone(abbreviation: "UTC")
        return dateformat
    }()
    
    
    var calendar = Calendar.current
    
    
    ///0: no dog
    ///1: my dog
    ///2: friend dog
    ///3: enemy dog
    ///4: both friend and enemy
    var scheduleColor = Array(repeating: 0, count: 24)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CalenderTableViewCell", bundle: nil), forCellReuseIdentifier: "reuseCell")
//        datePicker.timeZone = TimeZone(abbreviation: "UTC")
        
        
        calendar.timeZone = TimeZone(abbreviation: "UTC")!
        
        getOwner()
        getDogs()
        getSchedule()
        getFrienenmies()
        
    }
    
    @IBAction func dateChanged(_ sender: Any) {
        processSchedule()
        tableView.reloadData()
    }
    
    func getOwner() {
        let jsonData = Constants.jsonOwnerString.data(using: .utf8)
        do {
            let ownerList = try JSONDecoder().decode([Owner].self, from: jsonData!)
            for ow in ownerList {
                if ow.id == ownerId {
                    owner = ow
                }
            }
        }
        catch {
            print(error)
        }
    }
    
    func getDogs() {
        let jsonData = Constants.jsonDogsString.data(using: .utf8)
        do {
            dogs = try JSONDecoder().decode([Dog].self, from: jsonData!)
        }
        catch {
            print(error)
        }
    }
    
    func getSchedule() {
        let jsonData = Constants.jsonScheduleString.data(using: .utf8)
        do {
            schedule = try JSONDecoder().decode([Schedule].self, from: jsonData!)
            processSchedule()
        }
        catch {
            print(error)
        }
    }
    
    func getFrienenmies() {
        guard let owner = owner else {
            return
        }
        
        var lookup = [Int:Dog]()
        for d in dogs {
            lookup[d.id] = d
        }
        for d in owner.dogs {
            friends.append(contentsOf: lookup[d]?.friends ?? [])
            enemies.append(contentsOf: lookup[d]?.enemies ?? [])
        }
    }
    
    func processSchedule() {
        scheduleColor = Array(repeating: 0, count: 24)
        for time in schedule {
            getDogType(schedule: time)
        }
    }
    
    func getDogType(schedule: Schedule){
        guard let owner = owner else {
            return
        }
        
        //get my dog colors
        for mydog in owner.dogs {
            if mydog == schedule.dog_id {
                let startDate = dateformatter.date(from:schedule.start)
                guard let startDate = startDate else {
                    return
                }
                
                let endDate = dateformatter.date(from:schedule.end)
                guard let endDate = endDate else {
                    return
                }
                if(calendar.isDate(startDate, equalTo: datePicker.date, toGranularity: .day)) {
                    let starthour = calendar.component(.hour, from: startDate)
                    let endhour = calendar.component(.hour, from: endDate)
                    
                    for h in starthour...endhour {
                        scheduleColor[h] = 1
                    }
                }
            }
        }
        
        
        //get friend dog colors
        for dog in friends {
            if dog == schedule.dog_id {
                let startDate = dateformatter.date(from:schedule.start)
                guard let startDate = startDate else {
                    return
                }
                
                let endDate = dateformatter.date(from:schedule.start)
                guard let endDate = endDate else {
                    return
                }
                if(Calendar.current.isDate(startDate, equalTo: datePicker.date, toGranularity: .day)) {
                    let starthour = Calendar.current.component(.hour, from: startDate)
                    let endhour = Calendar.current.component(.hour, from: endDate)
                    
                    for h in starthour...endhour {
                        scheduleColor[h] = 2
                    }
                }
            }
        }
        
        //get enemy dog colors
        for dog in enemies {
            if dog == schedule.dog_id {
                let startDate = dateformatter.date(from:schedule.start)
                guard let startDate = startDate else {
                    return
                }
                
                let endDate = dateformatter.date(from:schedule.start)
                guard let endDate = endDate else {
                    return
                }
                if(Calendar.current.isDate(startDate, equalTo: datePicker.date, toGranularity: .day)) {
                    let starthour = Calendar.current.component(.hour, from: startDate)
                    let endhour = Calendar.current.component(.hour, from: endDate)
                    
                    for h in starthour...endhour {
                        switch scheduleColor[h] {
                        case 2:
                            scheduleColor[h] = 4
                        default:
                            scheduleColor[h] = 3
                        }
                    }
                }
            }
        }
    }

}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 24 //1 per hour
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseCell") as! CalenderTableViewCell
        cell.setUpCell(time: indexPath.row, color: scheduleColor[indexPath.row])
        return cell
    }
}
