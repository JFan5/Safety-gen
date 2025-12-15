; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 521589505 --problem-name spanner-s4-n3-l4-s521589505
(define (problem spanner-s4-n3-l4-s521589505)
 (:domain spanner)
 (:objects 
     obj_09 - type_1
     obj_07 obj_02 obj_05 obj_10 - type_2
     obj_03 obj_08 obj_14 - type_5
     obj_11 obj_01 obj_04 obj_12 - type_3
     obj_13 obj_06 - type_3
    )
 (:init 
    (pred_1 obj_09 obj_13)
    (pred_1 obj_07 obj_11)
    (pred_5 obj_07)
    (pred_1 obj_02 obj_12)
    (pred_5 obj_02)
    (pred_1 obj_05 obj_01)
    (pred_5 obj_05)
    (pred_1 obj_10 obj_11)
    (pred_5 obj_10)
    (pred_6 obj_03)
    (pred_1 obj_03 obj_06)
    (pred_6 obj_08)
    (pred_1 obj_08 obj_06)
    (pred_6 obj_14)
    (pred_1 obj_14 obj_06)
    (pred_2 obj_13 obj_11)
    (pred_2 obj_12 obj_06)
    (pred_2 obj_11 obj_01)
    (pred_2 obj_01 obj_04)
    (pred_2 obj_04 obj_12)
)
 (:goal
  (and
   (pred_4 obj_03)
   (pred_4 obj_08)
   (pred_4 obj_14)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_03)) (not (pred_4 obj_08))))
    (forall (?m - type_1) (at-most-once (pred_1 ?m obj_13)))
  )
)
)
