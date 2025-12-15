; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 440544634 --problem-name spanner-s2-n2-l3-s440544634
(define (problem spanner-s2-n2-l3-s440544634)
 (:domain spanner)
 (:objects 
     obj_02 - type_2
     obj_01 obj_03 - type_1
     obj_05 obj_08 - type_5
     obj_09 obj_10 obj_07 - type_4
     obj_06 obj_04 - type_4
    )
 (:init 
    (pred_6 obj_02 obj_06)
    (pred_6 obj_01 obj_09)
    (pred_3 obj_01)
    (pred_6 obj_03 obj_10)
    (pred_3 obj_03)
    (pred_2 obj_05)
    (pred_6 obj_05 obj_04)
    (pred_2 obj_08)
    (pred_6 obj_08 obj_04)
    (pred_5 obj_06 obj_09)
    (pred_5 obj_07 obj_04)
    (pred_5 obj_09 obj_10)
    (pred_5 obj_10 obj_07)
)
 (:goal
  (and
   (pred_1 obj_05)
   (pred_1 obj_08)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_05)) (not (pred_1 obj_08))))
    (forall (?m - type_2) (at-most-once (pred_6 ?m obj_06)))
  )
)
)
