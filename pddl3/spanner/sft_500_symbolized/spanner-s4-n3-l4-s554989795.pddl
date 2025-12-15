; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 554989795 --problem-name spanner-s4-n3-l4-s554989795
(define (problem spanner-s4-n3-l4-s554989795)
 (:domain spanner)
 (:objects 
     obj_01 - type_5
     obj_05 obj_04 obj_14 obj_11 - type_1
     obj_02 obj_09 obj_07 - type_3
     obj_06 obj_08 obj_10 obj_12 - type_2
     obj_03 obj_13 - type_2
    )
 (:init 
    (pred_4 obj_01 obj_03)
    (pred_4 obj_05 obj_08)
    (pred_6 obj_05)
    (pred_4 obj_04 obj_12)
    (pred_6 obj_04)
    (pred_4 obj_14 obj_08)
    (pred_6 obj_14)
    (pred_4 obj_11 obj_06)
    (pred_6 obj_11)
    (pred_2 obj_02)
    (pred_4 obj_02 obj_13)
    (pred_2 obj_09)
    (pred_4 obj_09 obj_13)
    (pred_2 obj_07)
    (pred_4 obj_07 obj_13)
    (pred_3 obj_03 obj_06)
    (pred_3 obj_12 obj_13)
    (pred_3 obj_06 obj_08)
    (pred_3 obj_08 obj_10)
    (pred_3 obj_10 obj_12)
)
 (:goal
  (and
   (pred_1 obj_02)
   (pred_1 obj_09)
   (pred_1 obj_07)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_02)) (not (pred_1 obj_09))))
    (forall (?m - type_5) (at-most-once (pred_4 ?m obj_03)))
  )
)
)
