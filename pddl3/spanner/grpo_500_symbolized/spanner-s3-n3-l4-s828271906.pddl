; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 828271906 --problem-name spanner-s3-n3-l4-s828271906
(define (problem spanner-s3-n3-l4-s828271906)
 (:domain spanner)
 (:objects 
     obj_09 - type_4
     obj_12 obj_13 obj_06 - type_5
     obj_01 obj_08 obj_04 - type_1
     obj_11 obj_02 obj_03 obj_10 - type_3
     obj_05 obj_07 - type_3
    )
 (:init 
    (pred_3 obj_09 obj_05)
    (pred_3 obj_12 obj_02)
    (pred_1 obj_12)
    (pred_3 obj_13 obj_10)
    (pred_1 obj_13)
    (pred_3 obj_06 obj_03)
    (pred_1 obj_06)
    (pred_5 obj_01)
    (pred_3 obj_01 obj_07)
    (pred_5 obj_08)
    (pred_3 obj_08 obj_07)
    (pred_5 obj_04)
    (pred_3 obj_04 obj_07)
    (pred_4 obj_05 obj_11)
    (pred_4 obj_10 obj_07)
    (pred_4 obj_11 obj_02)
    (pred_4 obj_02 obj_03)
    (pred_4 obj_03 obj_10)
)
 (:goal
  (and
   (pred_2 obj_01)
   (pred_2 obj_08)
   (pred_2 obj_04)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_01)) (not (pred_2 obj_08))))
    (forall (?m - type_4) (at-most-once (pred_3 ?m obj_05)))
  )
)
)
