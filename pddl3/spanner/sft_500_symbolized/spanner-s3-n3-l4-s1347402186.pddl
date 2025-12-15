; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1347402186 --problem-name spanner-s3-n3-l4-s1347402186
(define (problem spanner-s3-n3-l4-s1347402186)
 (:domain spanner)
 (:objects 
     obj_03 - type_4
     obj_01 obj_02 obj_09 - type_5
     obj_11 obj_06 obj_07 - type_1
     obj_13 obj_05 obj_10 obj_08 - type_3
     obj_04 obj_12 - type_3
    )
 (:init 
    (pred_6 obj_03 obj_04)
    (pred_6 obj_01 obj_13)
    (pred_5 obj_01)
    (pred_6 obj_02 obj_08)
    (pred_5 obj_02)
    (pred_6 obj_09 obj_13)
    (pred_5 obj_09)
    (pred_3 obj_11)
    (pred_6 obj_11 obj_12)
    (pred_3 obj_06)
    (pred_6 obj_06 obj_12)
    (pred_3 obj_07)
    (pred_6 obj_07 obj_12)
    (pred_2 obj_04 obj_13)
    (pred_2 obj_08 obj_12)
    (pred_2 obj_13 obj_05)
    (pred_2 obj_05 obj_10)
    (pred_2 obj_10 obj_08)
)
 (:goal
  (and
   (pred_1 obj_11)
   (pred_1 obj_06)
   (pred_1 obj_07)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_11)) (not (pred_1 obj_06))))
    (forall (?m - type_4) (at-most-once (pred_6 ?m obj_04)))
  )
)
)
