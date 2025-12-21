; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 982670166 --problem-name spanner-s4-n3-l4-s982670166
(define (problem spanner-s4-n3-l4-s982670166)
 (:domain spanner)
 (:objects 
     obj_08 - type_3
     obj_01 obj_06 obj_03 obj_12 - type_5
     obj_14 obj_05 obj_07 - type_4
     obj_02 obj_11 obj_09 obj_10 - type_2
     obj_13 obj_04 - type_2
    )
 (:init 
    (pred_2 obj_08 obj_13)
    (pred_2 obj_01 obj_11)
    (pred_1 obj_01)
    (pred_2 obj_06 obj_09)
    (pred_1 obj_06)
    (pred_2 obj_03 obj_09)
    (pred_1 obj_03)
    (pred_2 obj_12 obj_02)
    (pred_1 obj_12)
    (pred_5 obj_14)
    (pred_2 obj_14 obj_04)
    (pred_5 obj_05)
    (pred_2 obj_05 obj_04)
    (pred_5 obj_07)
    (pred_2 obj_07 obj_04)
    (pred_6 obj_13 obj_02)
    (pred_6 obj_10 obj_04)
    (pred_6 obj_02 obj_11)
    (pred_6 obj_11 obj_09)
    (pred_6 obj_09 obj_10)
)
 (:goal
  (and
   (pred_3 obj_14)
   (pred_3 obj_05)
   (pred_3 obj_07)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_14)) (not (pred_3 obj_05))))
    (forall (?m - type_3) (at-most-once (pred_2 ?m obj_13)))
  )
)
)
