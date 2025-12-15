; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1849111126 --problem-name spanner-s3-n3-l4-s1849111126
(define (problem spanner-s3-n3-l4-s1849111126)
 (:domain spanner)
 (:objects 
     obj_07 - type_5
     obj_06 obj_02 obj_04 - type_3
     obj_12 obj_03 obj_10 - type_2
     obj_09 obj_08 obj_01 obj_05 - type_4
     obj_13 obj_11 - type_4
    )
 (:init 
    (pred_2 obj_07 obj_13)
    (pred_2 obj_06 obj_01)
    (pred_1 obj_06)
    (pred_2 obj_02 obj_01)
    (pred_1 obj_02)
    (pred_2 obj_04 obj_08)
    (pred_1 obj_04)
    (pred_4 obj_12)
    (pred_2 obj_12 obj_11)
    (pred_4 obj_03)
    (pred_2 obj_03 obj_11)
    (pred_4 obj_10)
    (pred_2 obj_10 obj_11)
    (pred_5 obj_13 obj_09)
    (pred_5 obj_05 obj_11)
    (pred_5 obj_09 obj_08)
    (pred_5 obj_08 obj_01)
    (pred_5 obj_01 obj_05)
)
 (:goal
  (and
   (pred_6 obj_12)
   (pred_6 obj_03)
   (pred_6 obj_10)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_03)) (not (pred_6 obj_10))))
    (forall (?m - type_5) (at-most-once (pred_2 ?m obj_13)))
  )
)
)
