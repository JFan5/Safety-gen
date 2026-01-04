; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 521589505 --problem-name spanner-s4-n3-l4-s521589505
(define (problem spanner-s4-n3-l4-s521589505)
 (:domain spanner)
 (:objects 
     obj_13 - type_4
     obj_09 obj_11 obj_12 obj_06 - type_1
     obj_02 obj_05 obj_07 - type_2
     obj_03 obj_10 obj_04 obj_08 - type_3
     obj_14 obj_01 - type_3
    )
 (:init 
    (pred_5 obj_13 obj_14)
    (pred_5 obj_09 obj_03)
    (pred_6 obj_09)
    (pred_5 obj_11 obj_08)
    (pred_6 obj_11)
    (pred_5 obj_12 obj_10)
    (pred_6 obj_12)
    (pred_5 obj_06 obj_03)
    (pred_6 obj_06)
    (pred_1 obj_02)
    (pred_5 obj_02 obj_01)
    (pred_1 obj_05)
    (pred_5 obj_05 obj_01)
    (pred_1 obj_07)
    (pred_5 obj_07 obj_01)
    (pred_3 obj_14 obj_03)
    (pred_3 obj_08 obj_01)
    (pred_3 obj_03 obj_10)
    (pred_3 obj_10 obj_04)
    (pred_3 obj_04 obj_08)
)
 (:goal
  (and
   (pred_4 obj_02)
   (pred_4 obj_05)
   (pred_4 obj_07)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_02)) (not (pred_4 obj_05))))
    (forall (?m - type_4) (at-most-once (pred_5 ?m obj_14)))
  )
)
)
