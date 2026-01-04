; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 668315490 --problem-name spanner-s4-n3-l4-s668315490
(define (problem spanner-s4-n3-l4-s668315490)
 (:domain spanner)
 (:objects 
     obj_01 - type_1
     obj_06 obj_14 obj_08 obj_11 - type_4
     obj_05 obj_04 obj_03 - type_2
     obj_13 obj_07 obj_02 obj_09 - type_3
     obj_12 obj_10 - type_3
    )
 (:init 
    (pred_4 obj_01 obj_12)
    (pred_4 obj_06 obj_13)
    (pred_2 obj_06)
    (pred_4 obj_14 obj_07)
    (pred_2 obj_14)
    (pred_4 obj_08 obj_02)
    (pred_2 obj_08)
    (pred_4 obj_11 obj_02)
    (pred_2 obj_11)
    (pred_3 obj_05)
    (pred_4 obj_05 obj_10)
    (pred_3 obj_04)
    (pred_4 obj_04 obj_10)
    (pred_3 obj_03)
    (pred_4 obj_03 obj_10)
    (pred_6 obj_12 obj_13)
    (pred_6 obj_09 obj_10)
    (pred_6 obj_13 obj_07)
    (pred_6 obj_07 obj_02)
    (pred_6 obj_02 obj_09)
)
 (:goal
  (and
   (pred_1 obj_05)
   (pred_1 obj_04)
   (pred_1 obj_03)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_05)) (not (pred_1 obj_04))))
    (forall (?m - type_1) (at-most-once (pred_4 ?m obj_12)))
  )
)
)
