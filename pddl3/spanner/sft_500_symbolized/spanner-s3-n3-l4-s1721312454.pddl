; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1721312454 --problem-name spanner-s3-n3-l4-s1721312454
(define (problem spanner-s3-n3-l4-s1721312454)
 (:domain spanner)
 (:objects 
     obj_10 - type_1
     obj_11 obj_06 obj_02 - type_3
     obj_01 obj_04 obj_13 - type_5
     obj_12 obj_09 obj_07 obj_08 - type_4
     obj_03 obj_05 - type_4
    )
 (:init 
    (pred_4 obj_10 obj_03)
    (pred_4 obj_11 obj_07)
    (pred_1 obj_11)
    (pred_4 obj_06 obj_07)
    (pred_1 obj_06)
    (pred_4 obj_02 obj_07)
    (pred_1 obj_02)
    (pred_5 obj_01)
    (pred_4 obj_01 obj_05)
    (pred_5 obj_04)
    (pred_4 obj_04 obj_05)
    (pred_5 obj_13)
    (pred_4 obj_13 obj_05)
    (pred_6 obj_03 obj_12)
    (pred_6 obj_08 obj_05)
    (pred_6 obj_12 obj_09)
    (pred_6 obj_09 obj_07)
    (pred_6 obj_07 obj_08)
)
 (:goal
  (and
   (pred_3 obj_01)
   (pred_3 obj_04)
   (pred_3 obj_13)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_04)) (not (pred_3 obj_13))))
    (forall (?m - type_1) (at-most-once (pred_4 ?m obj_03)))
  )
)
)
