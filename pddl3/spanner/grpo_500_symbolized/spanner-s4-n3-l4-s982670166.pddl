; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 982670166 --problem-name spanner-s4-n3-l4-s982670166
(define (problem spanner-s4-n3-l4-s982670166)
 (:domain spanner)
 (:objects 
     obj_06 - type_5
     obj_11 obj_09 obj_05 obj_12 - type_3
     obj_07 obj_02 obj_01 - type_1
     obj_14 obj_04 obj_13 obj_10 - type_2
     obj_08 obj_03 - type_2
    )
 (:init 
    (pred_6 obj_06 obj_08)
    (pred_6 obj_11 obj_04)
    (pred_5 obj_11)
    (pred_6 obj_09 obj_13)
    (pred_5 obj_09)
    (pred_6 obj_05 obj_13)
    (pred_5 obj_05)
    (pred_6 obj_12 obj_14)
    (pred_5 obj_12)
    (pred_4 obj_07)
    (pred_6 obj_07 obj_03)
    (pred_4 obj_02)
    (pred_6 obj_02 obj_03)
    (pred_4 obj_01)
    (pred_6 obj_01 obj_03)
    (pred_3 obj_08 obj_14)
    (pred_3 obj_10 obj_03)
    (pred_3 obj_14 obj_04)
    (pred_3 obj_04 obj_13)
    (pred_3 obj_13 obj_10)
)
 (:goal
  (and
   (pred_1 obj_07)
   (pred_1 obj_02)
   (pred_1 obj_01)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_07)) (not (pred_1 obj_02))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_08)))
  )
)
)
