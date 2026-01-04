; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1883059892 --problem-name spanner-s3-n3-l4-s1883059892
(define (problem spanner-s3-n3-l4-s1883059892)
 (:domain spanner)
 (:objects 
     obj_09 - type_1
     obj_10 obj_01 obj_05 - type_2
     obj_12 obj_03 obj_13 - type_5
     obj_02 obj_07 obj_06 obj_08 - type_3
     obj_04 obj_11 - type_3
    )
 (:init 
    (pred_5 obj_09 obj_04)
    (pred_5 obj_10 obj_02)
    (pred_6 obj_10)
    (pred_5 obj_01 obj_08)
    (pred_6 obj_01)
    (pred_5 obj_05 obj_07)
    (pred_6 obj_05)
    (pred_3 obj_12)
    (pred_5 obj_12 obj_11)
    (pred_3 obj_03)
    (pred_5 obj_03 obj_11)
    (pred_3 obj_13)
    (pred_5 obj_13 obj_11)
    (pred_2 obj_04 obj_02)
    (pred_2 obj_08 obj_11)
    (pred_2 obj_02 obj_07)
    (pred_2 obj_07 obj_06)
    (pred_2 obj_06 obj_08)
)
 (:goal
  (and
   (pred_4 obj_12)
   (pred_4 obj_03)
   (pred_4 obj_13)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_12)) (not (pred_4 obj_03))))
    (forall (?m - type_1) (at-most-once (pred_5 ?m obj_04)))
  )
)
)
