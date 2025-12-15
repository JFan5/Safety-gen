; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 486073878 --problem-name spanner-s3-n3-l4-s486073878
(define (problem spanner-s3-n3-l4-s486073878)
 (:domain spanner)
 (:objects 
     obj_09 - type_4
     obj_08 obj_05 obj_01 - type_5
     obj_10 obj_04 obj_06 - type_1
     obj_13 obj_02 obj_12 obj_03 - type_3
     obj_11 obj_07 - type_3
    )
 (:init 
    (pred_3 obj_09 obj_11)
    (pred_3 obj_08 obj_12)
    (pred_1 obj_08)
    (pred_3 obj_05 obj_02)
    (pred_1 obj_05)
    (pred_3 obj_01 obj_02)
    (pred_1 obj_01)
    (pred_5 obj_10)
    (pred_3 obj_10 obj_07)
    (pred_5 obj_04)
    (pred_3 obj_04 obj_07)
    (pred_5 obj_06)
    (pred_3 obj_06 obj_07)
    (pred_4 obj_11 obj_13)
    (pred_4 obj_03 obj_07)
    (pred_4 obj_13 obj_02)
    (pred_4 obj_02 obj_12)
    (pred_4 obj_12 obj_03)
)
 (:goal
  (and
   (pred_2 obj_10)
   (pred_2 obj_04)
   (pred_2 obj_06)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_04)) (not (pred_2 obj_06))))
    (forall (?m - type_4) (at-most-once (pred_3 ?m obj_11)))
  )
)
)
