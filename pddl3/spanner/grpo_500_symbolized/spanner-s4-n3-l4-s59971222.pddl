; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 59971222 --problem-name spanner-s4-n3-l4-s59971222
(define (problem spanner-s4-n3-l4-s59971222)
 (:domain spanner)
 (:objects 
     obj_06 - type_5
     obj_09 obj_05 obj_11 obj_01 - type_3
     obj_07 obj_03 obj_08 - type_1
     obj_10 obj_14 obj_04 obj_02 - type_2
     obj_13 obj_12 - type_2
    )
 (:init 
    (pred_6 obj_06 obj_13)
    (pred_6 obj_09 obj_04)
    (pred_5 obj_09)
    (pred_6 obj_05 obj_04)
    (pred_5 obj_05)
    (pred_6 obj_11 obj_04)
    (pred_5 obj_11)
    (pred_6 obj_01 obj_14)
    (pred_5 obj_01)
    (pred_4 obj_07)
    (pred_6 obj_07 obj_12)
    (pred_4 obj_03)
    (pred_6 obj_03 obj_12)
    (pred_4 obj_08)
    (pred_6 obj_08 obj_12)
    (pred_3 obj_13 obj_10)
    (pred_3 obj_02 obj_12)
    (pred_3 obj_10 obj_14)
    (pred_3 obj_14 obj_04)
    (pred_3 obj_04 obj_02)
)
 (:goal
  (and
   (pred_1 obj_07)
   (pred_1 obj_03)
   (pred_1 obj_08)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_03)) (not (pred_1 obj_08))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_13)))
  )
)
)
