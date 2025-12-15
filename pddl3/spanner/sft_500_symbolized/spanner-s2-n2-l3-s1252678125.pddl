; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 1252678125 --problem-name spanner-s2-n2-l3-s1252678125
(define (problem spanner-s2-n2-l3-s1252678125)
 (:domain spanner)
 (:objects 
     obj_02 - type_1
     obj_01 obj_05 - type_4
     obj_08 obj_07 - type_3
     obj_03 obj_06 obj_04 - type_2
     obj_09 obj_10 - type_2
    )
 (:init 
    (pred_5 obj_02 obj_09)
    (pred_5 obj_01 obj_03)
    (pred_3 obj_01)
    (pred_5 obj_05 obj_03)
    (pred_3 obj_05)
    (pred_4 obj_08)
    (pred_5 obj_08 obj_10)
    (pred_4 obj_07)
    (pred_5 obj_07 obj_10)
    (pred_2 obj_09 obj_03)
    (pred_2 obj_04 obj_10)
    (pred_2 obj_03 obj_06)
    (pred_2 obj_06 obj_04)
)
 (:goal
  (and
   (pred_1 obj_08)
   (pred_1 obj_07)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_08)) (not (pred_1 obj_07))))
    (forall (?m - type_1) (at-most-once (pred_5 ?m obj_09)))
  )
)
)
