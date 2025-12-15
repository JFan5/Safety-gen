; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 283959957 --problem-name spanner-s2-n2-l3-s283959957
(define (problem spanner-s2-n2-l3-s283959957)
 (:domain spanner)
 (:objects 
     obj_07 - type_1
     obj_09 obj_03 - type_5
     obj_08 obj_06 - type_4
     obj_01 obj_10 obj_04 - type_3
     obj_02 obj_05 - type_3
    )
 (:init 
    (pred_6 obj_07 obj_02)
    (pred_6 obj_09 obj_10)
    (pred_4 obj_09)
    (pred_6 obj_03 obj_10)
    (pred_4 obj_03)
    (pred_3 obj_08)
    (pred_6 obj_08 obj_05)
    (pred_3 obj_06)
    (pred_6 obj_06 obj_05)
    (pred_2 obj_02 obj_01)
    (pred_2 obj_04 obj_05)
    (pred_2 obj_01 obj_10)
    (pred_2 obj_10 obj_04)
)
 (:goal
  (and
   (pred_1 obj_08)
   (pred_1 obj_06)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_08)) (not (pred_1 obj_06))))
    (forall (?m - type_1) (at-most-once (pred_6 ?m obj_02)))
  )
)
)
