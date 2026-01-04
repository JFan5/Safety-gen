; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 630996905 --problem-name spanner-s3-n3-l4-s630996905
(define (problem spanner-s3-n3-l4-s630996905)
 (:domain spanner)
 (:objects 
     obj_08 - type_2
     obj_05 obj_12 obj_06 - type_4
     obj_09 obj_04 obj_11 - type_1
     obj_07 obj_02 obj_01 obj_13 - type_3
     obj_03 obj_10 - type_3
    )
 (:init 
    (pred_6 obj_08 obj_03)
    (pred_6 obj_05 obj_02)
    (pred_2 obj_05)
    (pred_6 obj_12 obj_02)
    (pred_2 obj_12)
    (pred_6 obj_06 obj_01)
    (pred_2 obj_06)
    (pred_1 obj_09)
    (pred_6 obj_09 obj_10)
    (pred_1 obj_04)
    (pred_6 obj_04 obj_10)
    (pred_1 obj_11)
    (pred_6 obj_11 obj_10)
    (pred_4 obj_03 obj_07)
    (pred_4 obj_13 obj_10)
    (pred_4 obj_07 obj_02)
    (pred_4 obj_02 obj_01)
    (pred_4 obj_01 obj_13)
)
 (:goal
  (and
   (pred_5 obj_09)
   (pred_5 obj_04)
   (pred_5 obj_11)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_09)) (not (pred_5 obj_04))))
    (forall (?m - type_2) (at-most-once (pred_6 ?m obj_03)))
  )
)
)
