pragma solidity ^0.8.0;

contract StudentInformation
{
    struct Student{
        string Name;
        uint256 Age;
        string DOB;
        string gender;
        string club;
        string course;

    }
    uint256 public counter;
    mapping (uint256=> Student) StudentDetails;


    function EnterStudentDetails(string memory name,uint256 age,string memory dob,string memory gender,string memory club,string memory course,address account) public
    {
        require(msg.sender==acccount);
        uint256 ID=counter+1;
        StudentDetails[ID]=Student(name,age,dob,gender,club,course);
        counter++;

    }
    function RetriveStudentFromSameCourse(string memory course) public view returns(uint256[] memory)
    {
        uint256 count;
        uint256 i=0;
        for(i=0;i<counter+1;i++)
        {
            if(keccak256(bytes(StudentDetails[i].course))=keccak256(bytes(course)))
            {
                count++;
            }
        }

        uint256[] memory result=new uint256[](count);
        uint256 j=0;
        for(i=0;i<counter+1;i++)
        {
            if(keccak256(bytes(StudentDetails[i].course))==keccak256(bytes(course)))
            {
                result[j]=i;
                j++;
            }
        }
        return result;
    }

    function RetriveName(uint256 id) public view returns(string memory)
    {
        return StudentDetails[id].Name;
    }
    function RetriveAge(uint256 id) public view returns(uint256)
    {
        StudentDetails[id].Age;
    }
    function RetriveDOB(uint256 id) public view returns (uint256)
    {
        StudentDetails[id].dob;
    }
    function RetriveGender(uint256 id) public view returns(string memory)
    {
        StudentDetails[id].gender;
    }
    function RetriveClub(uint256 id) public view returns(string memory)
    {
        StudentDetails[id].club;
    }
    function RetriveCourse(uint256 id) public view returns(string memory)
    {
        StudentDetails[id].course;
    }
}
