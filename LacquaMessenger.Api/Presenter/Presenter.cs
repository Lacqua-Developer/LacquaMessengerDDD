using LacquaMessenger.Core.UseCase;
using MediatR;
using Microsoft.AspNetCore.Mvc;

namespace LacquaMessenger.Api.Presenter
{
    public class Presenter : IPresenter
    {
        private readonly IMediator _mediator;

        public Presenter(IMediator mediator)
        {
            _mediator = mediator;
        }

        public async Task<IActionResult> UseCaseResult(IUseCaseInput input)
        {
            try
            {
                var output = await _mediator.Send(input);
                object? result;

                if (output.Success)
                {
                    if (output.Data == null)
                        result = new() { };
                    else
                        result = output.Data;

                    return new OkObjectResult(result);
                }
                else
                    return new BadRequestObjectResult(new { code = output.ErrorCode, message = output.ErrorMessage });
            }
            catch (Exception ex)
            {
                //TODO: Adicionar Log
                throw;
            }
        }
    }
}
