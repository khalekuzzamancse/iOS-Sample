import Foundation
class AsyncWaitSamples{
    static func main(){
        Task{
            let user = (await fetchUser())
            let name = user?.name ?? "N/A"
            let thumbail = await user?.thumbail
            print(name)
            print(thumbail)
        }
        readLine()//Pretends as main thread is busy and doing other task
    }
}

fileprivate func fetchUser() async  ->User?{
    do{
        let name = try await _fetchName("1")
        let image = try? await _fetchImage("1")
        return User(address: "Dhaka", name: name, image: image)
    }
    catch (let error as Exception) {
        print(error)
    }
    catch {
        print(error)
    }
    return nil

    
}

fileprivate func _fetchImage(_ id:String) async throws ->String{
    return "https://www.x.y.com/image.png"
    
}
fileprivate func _fetchName(_ id:String) async throws->String{
    return "Mr. John"
}



fileprivate struct User {
    let address: String
    let name: String
    let image: String?
    var thumbail: String? { //Only read only propery can async
            get async {
                "Thumbnail is X*X"
            }
        }
    
}

fileprivate struct Exception: Error {
    let message: String
}
