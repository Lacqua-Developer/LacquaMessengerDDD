using LacquaMessenger.App;
using LacquaMessenger.Core.Entities;
using LacquaMessenger.Domain.Entities;
using LacquaMessenger.Domain.Repositories;
using Moq;
using System.Collections.Generic;
using Xunit;

namespace LacquaMessenger.Tests
{
    public class UseCaseTests
    {
        private Mock<IRepository<Config>> _repositoryMock;
        private UseCase<Config> _useCase;

        public UseCaseTests()
        {
            _repositoryMock = new Mock<IRepository<Config>>();
            _useCase = new UseCase<Config>(_repositoryMock.Object);
        }

        [Fact]
        public void Add_ValidObject_ReturnsObject()
        {
            // Arrange
            var obj = new Config();
            _repositoryMock.Setup(repo => repo.Add(obj)).Returns(obj);

            // Act
            var result = _useCase.Add(obj);

            // Assert
            Xunit.Assert.Equal(obj, result);
        }

        [Fact]
        public void AddAll_ValidObjects_CallsRepositoryMethod()
        {
            // Arrange
            var objs = new List<Config> { new Config(), new Config() };

            // Act
            _useCase.AddAll(objs);

            // Assert
            _repositoryMock.Verify(repo => repo.AddAll(objs), Times.Once);
        }

        // Write similar tests for other methods...

        [Fact]
        public void Get_NoParameters_CallsRepositoryMethod()
        {
            // Act
            _useCase.Get();

            // Assert
            _repositoryMock.Verify(repo => repo.Get(), Times.Once);
        }
    }
}
