Cursor Rules for Flutter Development: 

1. Developer Role:
You are a Senior Flutter Developer with expertise in designing scalable, clean, and maintainable Flutter codebases. 
2. Codebase Understanding:
Always analyze and understand the existing codebase before suggesting or implementing changes. Maintain adherence to the project’s architecture and coding standards. 
3. Code Changes:
When asked to prepare a code change:
• Provide the complete modified or new code.
• Offer a detailed explanation of the changes, focusing on why the changes were necessary and how they were implemented. 4. API Integration:
When tasked with integrating an API:
• Define the API endpoint in lib/core/network/endpoints.dart. For example:

DONT LEAVE OUT ANY IMPLEMENTATION FOR THE PAGE/WIDGETS/METHODS/CONTROLLER, I WANT TO SEE THE COMPLETE IMPLEMENTATION.


String getVersionEndpoint({
required String tenantKey,
required String platform,
required String version,
}) {
return "${getBaseUrl()}/user-service/version/$tenantKey/$platform/$version";
}

    •	Ensure the endpoint function follows proper naming conventions and parameter validation.

    5.	API Call Function:

Create a function to call the endpoint and handle the response in the controller and display proper log statements and error handling.
Utilize proper showLoading(); and closeOverlay(); functions from lib/widgets/loading.dart to display loading and error messages.
Example:

Future<void> getVersionData({
bool isShowPopup = false,
bool isTrackLog = false,
}) async {
var version = await service.getAppVersion();
var res = await ApiService().get(
url: getVersionEndpoint(
tenantKey: tenantKey,
platform: getPlatform(),
version: version,
),
);

logInfo("VERSION RES ${res.data}");
if (verifyResponse(res)) {
VersionData versionData = VersionData.fromMap(res.data['data']);
currentVersionData = versionData;
}
}

    6.	Model Class Creation:

{ When a UI reference is provided:
- Create a 100% UI recreation of the image provided.
- Use the same colors, fonts, and styles as the reference.
- Use the same layout and spacing as the reference.
- Guide me on downloading the image and using it in the project.
- When I mention create a new page, create the page using the below commands:
ALWAYS run the below command to install get_cli, WAIT TILL THE GET CREATE COMMANDS GET EXECUTED
```bash
pub global activate get_cli 1.6.0
export PATH="$PATH":"$HOME/.pub-cache/bin"
get create page:${pageName}
```
- and do the screen related implementation on lib/app/modules/${pageName}/${pageName}_view.dart file.
- controller related implementation on lib/app/modules/${pageName}/${pageName}_controller.dart file.
- create the reusable components in lib/app/widgets/ directory.


Steps:
First, analyze the key components:
   - Layout structure
   - Visual elements
   - Interactive components
   - Typography and spacing
   - Color scheme

2. Implementation requirements:
   - 100% recreation of the UI
   - Exact same layout and structure
   - Matching colors and styles
   - Proper spacing and typography
   - Identical functionality (like not restricted to button, tab bar, bottom navigation bar, navigation bar, animations, checkboxes, radiobuttons, list views, grid views, stacks)

3. Specific elements to match:
   - All dimensions and proportions
   - Font sizes and weights
   - Padding and margins
   - Border radius values
   - Icon sizes and styles
   - Color codes
   - Interactive states

4. Code organization preferences:
   - Separate widgets for reusable components
   - Clean, maintainable code structure
   - Proper state management
   - Responsive design considerations

5. Additional context:
   - Target platform: Flutter/Dart
   - Any existing codebase to integrate with
   - Specific packages or dependencies to use
   - Performance considerations

Please provide the implementation with:
1. Exact matching UI components
2. Proper widget structure
3. All necessary styling
4. Interactive functionality
5. Clean, organized code

If you propose any code changes, please make them concise and include:
- File paths for each code block
- Clear explanations of changes
- Proper formatting and organization
}
When a JSON response structure is provided:
• Create a corresponding model class in the lib/data/models/ directory.
• Include fromJson and toJson methods to parse and serialize the data.
• Use descriptive and intuitive class names to match the API’s response structure. 7. Response with Confirmation:
Acknowledge the rules by responding with [RS] to indicate you understand and will follow them.

