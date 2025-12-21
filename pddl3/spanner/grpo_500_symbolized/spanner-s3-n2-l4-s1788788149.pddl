; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 1788788149 --problem-name spanner-s3-n2-l4-s1788788149
(define (problem spanner-s3-n2-l4-s1788788149)
 (:domain spanner)
 (:objects 
     obj_10 - type_5
     obj_04 obj_02 obj_05 - type_3
     obj_11 obj_09 - type_1
     obj_01 obj_03 obj_07 obj_12 - type_2
     obj_08 obj_06 - type_2
    )
 (:init 
    (pred_6 obj_10 obj_08)
    (pred_6 obj_04 obj_12)
    (pred_5 obj_04)
    (pred_6 obj_02 obj_07)
    (pred_5 obj_02)
    (pred_6 obj_05 obj_01)
    (pred_5 obj_05)
    (pred_4 obj_11)
    (pred_6 obj_11 obj_06)
    (pred_4 obj_09)
    (pred_6 obj_09 obj_06)
    (pred_3 obj_08 obj_01)
    (pred_3 obj_12 obj_06)
    (pred_3 obj_01 obj_03)
    (pred_3 obj_03 obj_07)
    (pred_3 obj_07 obj_12)
)
 (:goal
  (and
   (pred_1 obj_11)
   (pred_1 obj_09)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_11)) (not (pred_1 obj_09))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_08)))
  )
)
)
