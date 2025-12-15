; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1201439916 --problem-name spanner-s3-n3-l4-s1201439916
(define (problem spanner-s3-n3-l4-s1201439916)
 (:domain spanner)
 (:objects 
     obj_04 - type_1
     obj_02 obj_11 obj_09 - type_3
     obj_10 obj_08 obj_03 - type_2
     obj_12 obj_13 obj_01 obj_06 - type_5
     obj_05 obj_07 - type_5
    )
 (:init 
    (pred_1 obj_04 obj_05)
    (pred_1 obj_02 obj_12)
    (pred_6 obj_02)
    (pred_1 obj_11 obj_12)
    (pred_6 obj_11)
    (pred_1 obj_09 obj_12)
    (pred_6 obj_09)
    (pred_4 obj_10)
    (pred_1 obj_10 obj_07)
    (pred_4 obj_08)
    (pred_1 obj_08 obj_07)
    (pred_4 obj_03)
    (pred_1 obj_03 obj_07)
    (pred_5 obj_05 obj_12)
    (pred_5 obj_06 obj_07)
    (pred_5 obj_12 obj_13)
    (pred_5 obj_13 obj_01)
    (pred_5 obj_01 obj_06)
)
 (:goal
  (and
   (pred_3 obj_10)
   (pred_3 obj_08)
   (pred_3 obj_03)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_10)) (not (pred_3 obj_08))))
    (forall (?m - type_1) (at-most-once (pred_1 ?m obj_05)))
  )
)
)
