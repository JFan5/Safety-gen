; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 59971222 --problem-name spanner-s4-n3-l4-s59971222
(define (problem spanner-s4-n3-l4-s59971222)
 (:domain spanner)
 (:objects 
     obj_08 - type_4
     obj_03 obj_14 obj_02 obj_05 - type_5
     obj_10 obj_04 obj_06 - type_1
     obj_13 obj_11 obj_09 obj_07 - type_3
     obj_01 obj_12 - type_3
    )
 (:init 
    (pred_3 obj_08 obj_01)
    (pred_3 obj_03 obj_09)
    (pred_1 obj_03)
    (pred_3 obj_14 obj_09)
    (pred_1 obj_14)
    (pred_3 obj_02 obj_09)
    (pred_1 obj_02)
    (pred_3 obj_05 obj_11)
    (pred_1 obj_05)
    (pred_5 obj_10)
    (pred_3 obj_10 obj_12)
    (pred_5 obj_04)
    (pred_3 obj_04 obj_12)
    (pred_5 obj_06)
    (pred_3 obj_06 obj_12)
    (pred_4 obj_01 obj_13)
    (pred_4 obj_07 obj_12)
    (pred_4 obj_13 obj_11)
    (pred_4 obj_11 obj_09)
    (pred_4 obj_09 obj_07)
)
 (:goal
  (and
   (pred_2 obj_10)
   (pred_2 obj_04)
   (pred_2 obj_06)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_04)) (not (pred_2 obj_06))))
    (forall (?m - type_4) (at-most-once (pred_3 ?m obj_01)))
  )
)
)
