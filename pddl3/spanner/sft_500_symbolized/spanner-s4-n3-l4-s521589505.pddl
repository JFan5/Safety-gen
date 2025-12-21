; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 521589505 --problem-name spanner-s4-n3-l4-s521589505
(define (problem spanner-s4-n3-l4-s521589505)
 (:domain spanner)
 (:objects 
     obj_14 - type_3
     obj_03 obj_09 obj_01 obj_05 - type_5
     obj_12 obj_02 obj_06 - type_4
     obj_07 obj_10 obj_04 obj_11 - type_2
     obj_08 obj_13 - type_2
    )
 (:init 
    (pred_2 obj_14 obj_08)
    (pred_2 obj_03 obj_07)
    (pred_1 obj_03)
    (pred_2 obj_09 obj_11)
    (pred_1 obj_09)
    (pred_2 obj_01 obj_10)
    (pred_1 obj_01)
    (pred_2 obj_05 obj_07)
    (pred_1 obj_05)
    (pred_5 obj_12)
    (pred_2 obj_12 obj_13)
    (pred_5 obj_02)
    (pred_2 obj_02 obj_13)
    (pred_5 obj_06)
    (pred_2 obj_06 obj_13)
    (pred_6 obj_08 obj_07)
    (pred_6 obj_11 obj_13)
    (pred_6 obj_07 obj_10)
    (pred_6 obj_10 obj_04)
    (pred_6 obj_04 obj_11)
)
 (:goal
  (and
   (pred_3 obj_12)
   (pred_3 obj_02)
   (pred_3 obj_06)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_12)) (not (pred_3 obj_02))))
    (forall (?m - type_3) (at-most-once (pred_2 ?m obj_08)))
  )
)
)
