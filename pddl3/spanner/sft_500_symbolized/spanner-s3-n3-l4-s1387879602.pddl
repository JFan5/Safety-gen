; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1387879602 --problem-name spanner-s3-n3-l4-s1387879602
(define (problem spanner-s3-n3-l4-s1387879602)
 (:domain spanner)
 (:objects 
     obj_02 - type_2
     obj_01 obj_12 obj_08 - type_4
     obj_04 obj_05 obj_13 - type_1
     obj_09 obj_07 obj_06 obj_03 - type_3
     obj_11 obj_10 - type_3
    )
 (:init 
    (pred_6 obj_02 obj_11)
    (pred_6 obj_01 obj_06)
    (pred_1 obj_01)
    (pred_6 obj_12 obj_03)
    (pred_1 obj_12)
    (pred_6 obj_08 obj_09)
    (pred_1 obj_08)
    (pred_5 obj_04)
    (pred_6 obj_04 obj_10)
    (pred_5 obj_05)
    (pred_6 obj_05 obj_10)
    (pred_5 obj_13)
    (pred_6 obj_13 obj_10)
    (pred_2 obj_11 obj_09)
    (pred_2 obj_03 obj_10)
    (pred_2 obj_09 obj_07)
    (pred_2 obj_07 obj_06)
    (pred_2 obj_06 obj_03)
)
 (:goal
  (and
   (pred_4 obj_04)
   (pred_4 obj_05)
   (pred_4 obj_13)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_05)) (not (pred_4 obj_13))))
    (forall (?m - type_2) (at-most-once (pred_6 ?m obj_11)))
  )
)
)
