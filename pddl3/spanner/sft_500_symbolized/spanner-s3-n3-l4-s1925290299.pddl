; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1925290299 --problem-name spanner-s3-n3-l4-s1925290299
(define (problem spanner-s3-n3-l4-s1925290299)
 (:domain spanner)
 (:objects 
     obj_06 - type_1
     obj_12 obj_08 obj_04 - type_5
     obj_09 obj_13 obj_05 - type_2
     obj_10 obj_07 obj_02 obj_11 - type_4
     obj_01 obj_03 - type_4
    )
 (:init 
    (pred_3 obj_06 obj_01)
    (pred_3 obj_12 obj_02)
    (pred_4 obj_12)
    (pred_3 obj_08 obj_02)
    (pred_4 obj_08)
    (pred_3 obj_04 obj_07)
    (pred_4 obj_04)
    (pred_6 obj_09)
    (pred_3 obj_09 obj_03)
    (pred_6 obj_13)
    (pred_3 obj_13 obj_03)
    (pred_6 obj_05)
    (pred_3 obj_05 obj_03)
    (pred_1 obj_01 obj_10)
    (pred_1 obj_11 obj_03)
    (pred_1 obj_10 obj_07)
    (pred_1 obj_07 obj_02)
    (pred_1 obj_02 obj_11)
)
 (:goal
  (and
   (pred_2 obj_09)
   (pred_2 obj_13)
   (pred_2 obj_05)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_13)) (not (pred_2 obj_05))))
    (forall (?m - type_1) (at-most-once (pred_3 ?m obj_01)))
  )
)
)
