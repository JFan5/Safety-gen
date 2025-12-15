; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 950422099 --problem-name spanner-s2-n2-l3-s950422099
(define (problem spanner-s2-n2-l3-s950422099)
 (:domain spanner)
 (:objects 
     obj_01 - type_1
     obj_04 obj_03 - type_5
     obj_05 obj_10 - type_3
     obj_06 obj_02 obj_07 - type_2
     obj_09 obj_08 - type_2
    )
 (:init 
    (pred_3 obj_01 obj_09)
    (pred_3 obj_04 obj_02)
    (pred_6 obj_04)
    (pred_3 obj_03 obj_02)
    (pred_6 obj_03)
    (pred_1 obj_05)
    (pred_3 obj_05 obj_08)
    (pred_1 obj_10)
    (pred_3 obj_10 obj_08)
    (pred_5 obj_09 obj_06)
    (pred_5 obj_07 obj_08)
    (pred_5 obj_06 obj_02)
    (pred_5 obj_02 obj_07)
)
 (:goal
  (and
   (pred_4 obj_05)
   (pred_4 obj_10)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_05)) (not (pred_4 obj_10))))
    (forall (?m - type_1) (at-most-once (pred_3 ?m obj_09)))
  )
)
)
