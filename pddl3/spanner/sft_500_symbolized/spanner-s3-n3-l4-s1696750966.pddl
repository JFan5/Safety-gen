; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1696750966 --problem-name spanner-s3-n3-l4-s1696750966
(define (problem spanner-s3-n3-l4-s1696750966)
 (:domain spanner)
 (:objects 
     obj_08 - type_5
     obj_12 obj_05 obj_13 - type_1
     obj_10 obj_11 obj_03 - type_2
     obj_01 obj_06 obj_02 obj_07 - type_3
     obj_04 obj_09 - type_3
    )
 (:init 
    (pred_3 obj_08 obj_04)
    (pred_3 obj_12 obj_01)
    (pred_2 obj_12)
    (pred_3 obj_05 obj_07)
    (pred_2 obj_05)
    (pred_3 obj_13 obj_02)
    (pred_2 obj_13)
    (pred_1 obj_10)
    (pred_3 obj_10 obj_09)
    (pred_1 obj_11)
    (pred_3 obj_11 obj_09)
    (pred_1 obj_03)
    (pred_3 obj_03 obj_09)
    (pred_4 obj_04 obj_01)
    (pred_4 obj_07 obj_09)
    (pred_4 obj_01 obj_06)
    (pred_4 obj_06 obj_02)
    (pred_4 obj_02 obj_07)
)
 (:goal
  (and
   (pred_6 obj_10)
   (pred_6 obj_11)
   (pred_6 obj_03)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_10)) (not (pred_6 obj_11))))
    (forall (?m - type_5) (at-most-once (pred_3 ?m obj_04)))
  )
)
)
