; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1406976793 --problem-name spanner-s3-n3-l4-s1406976793
(define (problem spanner-s3-n3-l4-s1406976793)
 (:domain spanner)
 (:objects 
     obj_13 - type_3
     obj_11 obj_10 obj_03 - type_4
     obj_09 obj_12 obj_04 - type_1
     obj_01 obj_05 obj_08 obj_07 - type_2
     obj_02 obj_06 - type_2
    )
 (:init 
    (pred_2 obj_13 obj_02)
    (pred_2 obj_11 obj_01)
    (pred_6 obj_11)
    (pred_2 obj_10 obj_07)
    (pred_6 obj_10)
    (pred_2 obj_03 obj_01)
    (pred_6 obj_03)
    (pred_3 obj_09)
    (pred_2 obj_09 obj_06)
    (pred_3 obj_12)
    (pred_2 obj_12 obj_06)
    (pred_3 obj_04)
    (pred_2 obj_04 obj_06)
    (pred_5 obj_02 obj_01)
    (pred_5 obj_07 obj_06)
    (pred_5 obj_01 obj_05)
    (pred_5 obj_05 obj_08)
    (pred_5 obj_08 obj_07)
)
 (:goal
  (and
   (pred_4 obj_09)
   (pred_4 obj_12)
   (pred_4 obj_04)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_09)) (not (pred_4 obj_12))))
    (forall (?m - type_3) (at-most-once (pred_2 ?m obj_02)))
  )
)
)
