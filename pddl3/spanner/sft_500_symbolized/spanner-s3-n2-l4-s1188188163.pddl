; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 1188188163 --problem-name spanner-s3-n2-l4-s1188188163
(define (problem spanner-s3-n2-l4-s1188188163)
 (:domain spanner)
 (:objects 
     obj_09 - type_1
     obj_01 obj_02 obj_08 - type_4
     obj_05 obj_07 - type_3
     obj_11 obj_12 obj_04 obj_03 - type_2
     obj_10 obj_06 - type_2
    )
 (:init 
    (pred_5 obj_09 obj_10)
    (pred_5 obj_01 obj_03)
    (pred_4 obj_01)
    (pred_5 obj_02 obj_12)
    (pred_4 obj_02)
    (pred_5 obj_08 obj_03)
    (pred_4 obj_08)
    (pred_2 obj_05)
    (pred_5 obj_05 obj_06)
    (pred_2 obj_07)
    (pred_5 obj_07 obj_06)
    (pred_6 obj_10 obj_11)
    (pred_6 obj_03 obj_06)
    (pred_6 obj_11 obj_12)
    (pred_6 obj_12 obj_04)
    (pred_6 obj_04 obj_03)
)
 (:goal
  (and
   (pred_3 obj_05)
   (pred_3 obj_07)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_05)) (not (pred_3 obj_07))))
    (forall (?m - type_1) (at-most-once (pred_5 ?m obj_10)))
  )
)
)
