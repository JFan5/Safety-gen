; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 668315490 --problem-name spanner-s4-n3-l4-s668315490
(define (problem spanner-s4-n3-l4-s668315490)
 (:domain spanner)
 (:objects 
     obj_13 - type_3
     obj_07 obj_05 obj_02 obj_10 - type_5
     obj_03 obj_01 obj_14 - type_4
     obj_11 obj_12 obj_09 obj_08 - type_2
     obj_04 obj_06 - type_2
    )
 (:init 
    (pred_2 obj_13 obj_04)
    (pred_2 obj_07 obj_11)
    (pred_1 obj_07)
    (pred_2 obj_05 obj_12)
    (pred_1 obj_05)
    (pred_2 obj_02 obj_09)
    (pred_1 obj_02)
    (pred_2 obj_10 obj_09)
    (pred_1 obj_10)
    (pred_5 obj_03)
    (pred_2 obj_03 obj_06)
    (pred_5 obj_01)
    (pred_2 obj_01 obj_06)
    (pred_5 obj_14)
    (pred_2 obj_14 obj_06)
    (pred_6 obj_04 obj_11)
    (pred_6 obj_08 obj_06)
    (pred_6 obj_11 obj_12)
    (pred_6 obj_12 obj_09)
    (pred_6 obj_09 obj_08)
)
 (:goal
  (and
   (pred_3 obj_03)
   (pred_3 obj_01)
   (pred_3 obj_14)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_03)) (not (pred_3 obj_01))))
    (forall (?m - type_3) (at-most-once (pred_2 ?m obj_04)))
  )
)
)
