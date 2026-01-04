; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 2103025569 --problem-name spanner-s3-n3-l4-s2103025569
(define (problem spanner-s3-n3-l4-s2103025569)
 (:domain spanner)
 (:objects 
     obj_05 - type_2
     obj_09 obj_13 obj_10 - type_3
     obj_08 obj_11 obj_01 - type_1
     obj_07 obj_06 obj_02 obj_04 - type_5
     obj_03 obj_12 - type_5
    )
 (:init 
    (pred_4 obj_05 obj_03)
    (pred_4 obj_09 obj_06)
    (pred_5 obj_09)
    (pred_4 obj_13 obj_04)
    (pred_5 obj_13)
    (pred_4 obj_10 obj_06)
    (pred_5 obj_10)
    (pred_3 obj_08)
    (pred_4 obj_08 obj_12)
    (pred_3 obj_11)
    (pred_4 obj_11 obj_12)
    (pred_3 obj_01)
    (pred_4 obj_01 obj_12)
    (pred_2 obj_03 obj_07)
    (pred_2 obj_04 obj_12)
    (pred_2 obj_07 obj_06)
    (pred_2 obj_06 obj_02)
    (pred_2 obj_02 obj_04)
)
 (:goal
  (and
   (pred_1 obj_08)
   (pred_1 obj_11)
   (pred_1 obj_01)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_08)) (not (pred_1 obj_11))))
    (forall (?m - type_2) (at-most-once (pred_4 ?m obj_03)))
  )
)
)
