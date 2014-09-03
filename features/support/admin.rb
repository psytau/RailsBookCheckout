
def check_can_do_box_for user, it, yes
    checkbox = page.find("#user-row-#{user.id} input.#{it}")
    # if yes, make sure its not checked
    if yes
      expect(checkbox).not_to be_checked
    else
      expect(checkbox).to be_checked
    end
    # if yes, uncheck it
    checkbox.set yes
    # if yes, make sure it is now checked
    if yes
      expect(checkbox).to be_checked
    else
      expect(checkbox).not_to be_checked
    end
end
