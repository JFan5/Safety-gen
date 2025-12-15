; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 290536586 --problem-name spanner-s3-n3-l4-s290536586
(define (problem spanner-s3-n3-l4-s290536586)
 (:domain spanner)
 (:objects 
     obj_11 - type_3
     obj_05 obj_13 obj_10 - type_1
     obj_07 obj_09 obj_04 - type_4
     obj_12 obj_08 obj_02 obj_01 - type_2
     obj_03 obj_06 - type_2
    )
 (:init 
    (pred_6 obj_11 obj_03)
    (pred_6 obj_05 obj_12)
    (pred_4 obj_05)
    (pred_6 obj_13 obj_01)
    (pred_4 obj_13)
    (pred_6 obj_10 obj_12)
    (pred_4 obj_10)
    (pred_5 obj_07)
    (pred_6 obj_07 obj_06)
    (pred_5 obj_09)
    (pred_6 obj_09 obj_06)
    (pred_5 obj_04)
    (pred_6 obj_04 obj_06)
    (pred_1 obj_03 obj_12)
    (pred_1 obj_01 obj_06)
    (pred_1 obj_12 obj_08)
    (pred_1 obj_08 obj_02)
    (pred_1 obj_02 obj_01)
)
 (:goal
  (and
   (pred_3 obj_07)
   (pred_3 obj_09)
   (pred_3 obj_04)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_07)) (not (pred_3 obj_09))))
    (forall (?m - type_3) (at-most-once (pred_6 ?m obj_03)))
  )
)
)
