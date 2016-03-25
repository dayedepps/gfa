class GFA::Record::Containment < GFA::Record
  CODE = :C
  REQ_FIELDS = [:from, :from_orient, :to, :to_orient, :pos, :overlap]
  OPT_FIELDS = {
    :RC => :i,
    :NM => :i
  }

  REQ_FIELDS.each_index do |i|
    define_method(REQ_FIELDS[i]) { fields[i+2] }
  end
   
  def initialize(from, from_orient, to, to_orient, pos, overlap, *opt_fields)
    @fields = {}
    add_field(2, :Z, from, /^[!-)+-<>-~][!-~]*$/)
    add_field(3, :Z, from_orient, /^+|-$/)
    add_field(4, :Z, to, /^[!-)+-<>-~][!-~]*$/)
    add_field(5, :Z, to_orient, /^+|-$/)
    add_field(6, :i, pos, /^[0-9]*$/)
    add_field(7, :Z, overlap, /^\*|([0-9]+[MIDNSHPX=])+$/)
    opt_fields.each{ |f| add_opt_field(f, OPT_FIELDS) }
  end

end
