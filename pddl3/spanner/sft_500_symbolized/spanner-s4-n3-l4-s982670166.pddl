; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 982670166 --problem-name spanner-s4-n3-l4-s982670166
(define (problem spanner-s4-n3-l4-s982670166)
 (:domain spanner)
 (:objects 
     obj_09 - type_4
     obj_10 obj_11 obj_06 obj_12 - type_5
     obj_02 obj_04 obj_13 - type_1
     obj_14 obj_08 obj_07 obj_05 - type_2
     obj_01 obj_03 - type_2
    )
 (:init 
    (pred_5 obj_09 obj_01)
    (pred_5 obj_10 obj_08)
    (pred_3 obj_10)
    (pred_5 obj_11 obj_07)
    (pred_3 obj_11)
    (pred_5 obj_06 obj_07)
    (pred_3 obj_06)
    (pred_5 obj_12 obj_14)
    (pred_3 obj_12)
    (pred_6 obj_02)
    (pred_5 obj_02 obj_03)
    (pred_6 obj_04)
    (pred_5 obj_04 obj_03)
    (pred_6 obj_13)
    (pred_5 obj_13 obj_03)
    (pred_1 obj_01 obj_14)
    (pred_1 obj_05 obj_03)
    (pred_1 obj_14 obj_08)
    (pred_1 obj_08 obj_07)
    (pred_1 obj_07 obj_05)
)
 (:goal
  (and
   (pred_4 obj_02)
   (pred_4 obj_04)
   (pred_4 obj_13)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_02)) (not (pred_4 obj_04))))
    (forall (?m - type_4) (at-most-once (pred_5 ?m obj_01)))
  )
)
)
