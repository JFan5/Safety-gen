; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1548293233 --problem-name spanner-s3-n3-l4-s1548293233
(define (problem spanner-s3-n3-l4-s1548293233)
 (:domain spanner)
 (:objects 
     obj_04 - type_2
     obj_05 obj_08 obj_12 - type_3
     obj_03 obj_07 obj_06 - type_4
     obj_01 obj_10 obj_11 obj_09 - type_5
     obj_13 obj_02 - type_5
    )
 (:init 
    (pred_3 obj_04 obj_13)
    (pred_3 obj_05 obj_11)
    (pred_4 obj_05)
    (pred_3 obj_08 obj_11)
    (pred_4 obj_08)
    (pred_3 obj_12 obj_11)
    (pred_4 obj_12)
    (pred_6 obj_03)
    (pred_3 obj_03 obj_02)
    (pred_6 obj_07)
    (pred_3 obj_07 obj_02)
    (pred_6 obj_06)
    (pred_3 obj_06 obj_02)
    (pred_5 obj_13 obj_01)
    (pred_5 obj_09 obj_02)
    (pred_5 obj_01 obj_10)
    (pred_5 obj_10 obj_11)
    (pred_5 obj_11 obj_09)
)
 (:goal
  (and
   (pred_1 obj_03)
   (pred_1 obj_07)
   (pred_1 obj_06)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_07)) (not (pred_1 obj_06))))
    (forall (?m - type_2) (at-most-once (pred_3 ?m obj_13)))
  )
)
)
