; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1812854047 --problem-name spanner-s3-n3-l4-s1812854047
(define (problem spanner-s3-n3-l4-s1812854047)
 (:domain spanner)
 (:objects 
     obj_05 - type_5
     obj_10 obj_07 obj_08 - type_3
     obj_06 obj_03 obj_09 - type_1
     obj_13 obj_02 obj_12 obj_01 - type_2
     obj_11 obj_04 - type_2
    )
 (:init 
    (pred_6 obj_05 obj_11)
    (pred_6 obj_10 obj_12)
    (pred_5 obj_10)
    (pred_6 obj_07 obj_13)
    (pred_5 obj_07)
    (pred_6 obj_08 obj_13)
    (pred_5 obj_08)
    (pred_4 obj_06)
    (pred_6 obj_06 obj_04)
    (pred_4 obj_03)
    (pred_6 obj_03 obj_04)
    (pred_4 obj_09)
    (pred_6 obj_09 obj_04)
    (pred_3 obj_11 obj_13)
    (pred_3 obj_01 obj_04)
    (pred_3 obj_13 obj_02)
    (pred_3 obj_02 obj_12)
    (pred_3 obj_12 obj_01)
)
 (:goal
  (and
   (pred_1 obj_06)
   (pred_1 obj_03)
   (pred_1 obj_09)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_03)) (not (pred_1 obj_09))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_11)))
  )
)
)
