; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1439718714 --problem-name spanner-s3-n3-l4-s1439718714
(define (problem spanner-s3-n3-l4-s1439718714)
 (:domain spanner)
 (:objects 
     obj_09 - type_3
     obj_05 obj_07 obj_06 - type_2
     obj_12 obj_11 obj_08 - type_1
     obj_03 obj_01 obj_02 obj_04 - type_4
     obj_13 obj_10 - type_4
    )
 (:init 
    (pred_4 obj_09 obj_13)
    (pred_4 obj_05 obj_02)
    (pred_1 obj_05)
    (pred_4 obj_07 obj_01)
    (pred_1 obj_07)
    (pred_4 obj_06 obj_03)
    (pred_1 obj_06)
    (pred_3 obj_12)
    (pred_4 obj_12 obj_10)
    (pred_3 obj_11)
    (pred_4 obj_11 obj_10)
    (pred_3 obj_08)
    (pred_4 obj_08 obj_10)
    (pred_2 obj_13 obj_03)
    (pred_2 obj_04 obj_10)
    (pred_2 obj_03 obj_01)
    (pred_2 obj_01 obj_02)
    (pred_2 obj_02 obj_04)
)
 (:goal
  (and
   (pred_6 obj_12)
   (pred_6 obj_11)
   (pred_6 obj_08)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_11)) (not (pred_6 obj_08))))
    (forall (?m - type_3) (at-most-once (pred_4 ?m obj_13)))
  )
)
)
