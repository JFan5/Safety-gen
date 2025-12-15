; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 630996905 --problem-name spanner-s3-n3-l4-s630996905
(define (problem spanner-s3-n3-l4-s630996905)
 (:domain spanner)
 (:objects 
     obj_12 - type_2
     obj_10 obj_03 obj_09 - type_5
     obj_07 obj_11 obj_01 - type_4
     obj_13 obj_04 obj_02 obj_06 - type_3
     obj_05 obj_08 - type_3
    )
 (:init 
    (pred_4 obj_12 obj_05)
    (pred_4 obj_10 obj_04)
    (pred_3 obj_10)
    (pred_4 obj_03 obj_04)
    (pred_3 obj_03)
    (pred_4 obj_09 obj_02)
    (pred_3 obj_09)
    (pred_5 obj_07)
    (pred_4 obj_07 obj_08)
    (pred_5 obj_11)
    (pred_4 obj_11 obj_08)
    (pred_5 obj_01)
    (pred_4 obj_01 obj_08)
    (pred_2 obj_05 obj_13)
    (pred_2 obj_06 obj_08)
    (pred_2 obj_13 obj_04)
    (pred_2 obj_04 obj_02)
    (pred_2 obj_02 obj_06)
)
 (:goal
  (and
   (pred_6 obj_07)
   (pred_6 obj_11)
   (pred_6 obj_01)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_07)) (not (pred_6 obj_11))))
    (forall (?m - type_2) (at-most-once (pred_4 ?m obj_05)))
  )
)
)
