; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1925290299 --problem-name spanner-s3-n3-l4-s1925290299
(define (problem spanner-s3-n3-l4-s1925290299)
 (:domain spanner)
 (:objects 
     obj_08 - type_3
     obj_07 obj_11 obj_03 - type_4
     obj_13 obj_01 obj_05 - type_1
     obj_02 obj_04 obj_12 obj_09 - type_2
     obj_06 obj_10 - type_2
    )
 (:init 
    (pred_5 obj_08 obj_06)
    (pred_5 obj_07 obj_12)
    (pred_6 obj_07)
    (pred_5 obj_11 obj_12)
    (pred_6 obj_11)
    (pred_5 obj_03 obj_04)
    (pred_6 obj_03)
    (pred_2 obj_13)
    (pred_5 obj_13 obj_10)
    (pred_2 obj_01)
    (pred_5 obj_01 obj_10)
    (pred_2 obj_05)
    (pred_5 obj_05 obj_10)
    (pred_1 obj_06 obj_02)
    (pred_1 obj_09 obj_10)
    (pred_1 obj_02 obj_04)
    (pred_1 obj_04 obj_12)
    (pred_1 obj_12 obj_09)
)
 (:goal
  (and
   (pred_4 obj_13)
   (pred_4 obj_01)
   (pred_4 obj_05)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_01)) (not (pred_4 obj_05))))
    (forall (?m - type_3) (at-most-once (pred_5 ?m obj_06)))
  )
)
)
