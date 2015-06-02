---
title: Ruby on Rails – Foreign Key Constraints in MySQL
author: Sonia Hamilton
date: 2008-10-01
url: /2008/10/01/ruby-on-rails-foreign-key-constraints-in-mysql/
categories:
  - Other-Tech
tags:
  - MySQL
  - Ruby
  - Ruby on Rails
---
As an ex-DBA, one of the things that annoys me about Rails is that migrations don't have a way of setting up referential integrity (I'm still using Rails 1.2.3, so this may have changed).

<!--more-->

But apart from that, I lurv Rails :-)

Here's some code I wrote to for adding and removing foreign key constraints on MySQL (using InnoDB, of course). There's other code out there to do the same thing, but they didn't do what I wanted, or required installing a plugin.<!--more-->

In the lib directory, add the file **migration_helpers.rb**:

<pre>module MigrationHelpers
  def foreign_key(from_table, from_column, to_table, to_column, on_delete='SET NULL', on_update='CASCADE')
    constraint_name = "fk_#{from_table}_#{to_table}"
    execute %{alter table #{from_table}
      add constraint #{constraint_name}
      foreign key (#{from_column})
      references #{to_table}(#{to_column})
      on delete #{on_delete}
      on update #{on_update}
    }
  end
  def drop_foreign_key(from_table, to_table)
    constraint_name = "fk_#{from_table}_#{to_table}"
    execute "alter table #{from_table} drop foreign key #{constraint_name}"
    execute "alter table #{from_table} drop key #{constraint_name}"
  end
end</pre>

Then, in a migration you would do something like the following:

<pre>require "migration_helpers"
class Vmtypes &lt; ActiveRecord::Migration
  extend MigrationHelpers  # see lib/migration_helpers.rb
  def self.up
    create_table :vmtypes, :primary_key =&gt; :vmtype_id do |t|
      t.column :vmname, :string
    end
    execute "alter table asset add column vmtype_id int after vmhost_id;"
    foreign_key :asset, :vmtype_id, :vmtypes, :vmtype_id, 'RESTRICT'
  end

  def self.down
    drop_foreign_key :asset, :vmtypes
    drop_table :vmtypes
    remove_column :asset, :vmtype_id
  end
end</pre>

I wrote this code for MySQL; I don't know whether it would work with other backends. Notice the MySQL oddity that you add a foreign key using one line of code, but drop a foreign key using two lines of code (foreign key then key).

On of the features of my code for adding the foreign key is that it allows (requires) you to specify the column names. I did this because I like the primary keys in my tables to be named foo_id rather than id, to make things a little more self documenting.

The next thing I want to work out is how to create/use tables with non-integer primary keys -- seems like an issue that a few people have struggled with.:

  * [HowToUseNonDatabaseProvidedIDs][1]
  * [:id-less legacy databases][2]
  * [Active Record and non-numeric, natural primary keys][3]

**Update 9-June-2009:**

I've updated my code to allow suffixes on foreign key names -- useful (for example) when having multiple foreign keys going to the same destination table:

<pre>module MigrationHelpers
 def foreign_key(from_table, from_column, to_table, to_column, suffix=nil, on_delete='SET NULL', on_update='CASCADE')
   constraint_name = "fk_#{from_table}_#{to_table}"
   constraint_name += "_#{suffix}" unless suffix.nil?
   execute %{alter table #{from_table}
     add constraint #{constraint_name}
     foreign key (#{from_column})
     references #{to_table}(#{to_column})
     on delete #{on_delete}
     on update #{on_update}
   }
 end
 def drop_foreign_key(from_table, to_table, suffix=nil)
   constraint_name = "fk_#{from_table}_#{to_table}"
   constraint_name += "_#{suffix}" unless suffix.nil?
   execute "alter table #{from_table} drop foreign key #{constraint_name}"
   execute "alter table #{from_table} drop key #{constraint_name}"
 end
end</pre>

 [1]: http://wiki.rubyonrails.org/rails/pages/HowToUseNonDatabaseProvidedIDs
 [2]: http://railsforum.com/viewtopic.php?pid=65043
 [3]: http://www.ruby-forum.com/topic/85912
