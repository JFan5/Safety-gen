; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 1841547803 --problem-name spanner-s3-n2-l4-s1841547803
(define (problem spanner-s3-n2-l4-s1841547803)
 (:domain spanner)
 (:objects 
     obj_07 - type_4
     obj_11 obj_09 obj_03 - type_1
     obj_02 obj_12 - type_2
     obj_08 obj_01 obj_04 obj_05 - type_3
     obj_06 obj_10 - type_3
    )
 (:init 
    (pred_3 obj_07 obj_06)
    (pred_3 obj_11 obj_05)
    (pred_6 obj_11)
    (pred_3 obj_09 obj_01)
    (pred_6 obj_09)
    (pred_3 obj_03 obj_04)
    (pred_6 obj_03)
    (pred_2 obj_02)
    (pred_3 obj_02 obj_10)
    (pred_2 obj_12)
    (pred_3 obj_12 obj_10)
    (pred_1 obj_06 obj_08)
    (pred_1 obj_05 obj_10)
    (pred_1 obj_08 obj_01)
    (pred_1 obj_01 obj_04)
    (pred_1 obj_04 obj_05)
)
 (:goal
  (and
   (pred_4 obj_02)
   (pred_4 obj_12)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_02)) (not (pred_4 obj_12))))
    (forall (?m - type_4) (at-most-once (pred_3 ?m obj_06)))
  )
)
)
