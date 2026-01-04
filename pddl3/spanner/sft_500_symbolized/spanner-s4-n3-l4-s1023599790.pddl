; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1023599790 --problem-name spanner-s4-n3-l4-s1023599790
(define (problem spanner-s4-n3-l4-s1023599790)
 (:domain spanner)
 (:objects 
     obj_07 - type_1
     obj_08 obj_10 obj_13 obj_05 - type_2
     obj_14 obj_04 obj_01 - type_3
     obj_06 obj_09 obj_12 obj_03 - type_4
     obj_11 obj_02 - type_4
    )
 (:init 
    (pred_5 obj_07 obj_11)
    (pred_5 obj_08 obj_12)
    (pred_4 obj_08)
    (pred_5 obj_10 obj_09)
    (pred_4 obj_10)
    (pred_5 obj_13 obj_12)
    (pred_4 obj_13)
    (pred_5 obj_05 obj_06)
    (pred_4 obj_05)
    (pred_2 obj_14)
    (pred_5 obj_14 obj_02)
    (pred_2 obj_04)
    (pred_5 obj_04 obj_02)
    (pred_2 obj_01)
    (pred_5 obj_01 obj_02)
    (pred_1 obj_11 obj_06)
    (pred_1 obj_03 obj_02)
    (pred_1 obj_06 obj_09)
    (pred_1 obj_09 obj_12)
    (pred_1 obj_12 obj_03)
)
 (:goal
  (and
   (pred_3 obj_14)
   (pred_3 obj_04)
   (pred_3 obj_01)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_04)) (not (pred_3 obj_01))))
    (forall (?m - type_1) (at-most-once (pred_5 ?m obj_11)))
  )
)
)
