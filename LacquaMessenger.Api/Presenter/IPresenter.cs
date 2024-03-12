using LacquaMessenger.Core.UseCase;
using Microsoft.AspNetCore.Mvc;

namespace LacquaMessenger.Api.Presenter
{
    public interface IPresenter
    {
        Task<IActionResult> UseCaseResult(IUseCaseInput input);
    }
}
